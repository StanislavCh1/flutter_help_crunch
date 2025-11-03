import Flutter
import UIKit
import HelpCrunchSDK

public class FlutterHelpCrunchPlugin: NSObject, FlutterPlugin, FlutterHelpCrunchApi {
    public static func register(with registrar: any FlutterPluginRegistrar) {
        let plugin = FlutterHelpCrunchPlugin()
        FlutterHelpCrunchApiSetup.setUp(binaryMessenger: registrar.messenger(), api: plugin)
        registrar.publish(plugin)
        registrar.addApplicationDelegate(plugin)
    }
    
    func initialize(configuration: ConfigurationMessage, user: UserMessage, theme: ThemeMessage?) throws {
        let configuration = HCSConfiguration(forOrganization: configuration.organization, applicationId: String(configuration.applicationId), applicationSecret: configuration.applicationSecret)
        
        let hcUser = HCSUser()
        hcUser.userId = user.id
        hcUser.email = user.email
        hcUser.phone = user.phone
        bindTheme(theme: theme)
        HelpCrunchSDK.HelpCrunch.initWith(configuration, user: hcUser)
    }
    
    func updateUser(user: UserMessage) throws {
        let hcUser = HCSUser()
        hcUser.userId = user.id
        hcUser.email = user.email
        hcUser.phone = user.phone
        HelpCrunchSDK.HelpCrunch.update(hcUser)
    }
    
    func showChatScreen() throws -> Bool {
        var rootVC: UIViewController?

           if #available(iOS 13.0, *) {
               rootVC = UIApplication.shared.connectedScenes
                   .compactMap { $0 as? UIWindowScene }
                   .flatMap { $0.windows }
                   .first(where: { $0.isKeyWindow })?
                   .rootViewController
           } else {
               rootVC = UIApplication.shared.keyWindow?.rootViewController
           }

           guard let vc = rootVC else {
               throw NSError(
                   domain: "AppError",
                   code: 1,
                   userInfo: [NSLocalizedDescriptionKey: "Root view controller not found."]
               )
           }

        
        var result = false
        HelpCrunch.show(from: vc) { error in
               if let error = error {
                   print("HelpCrunch error: \(error)")
               } else {
                   result = true
                   print("HelpCrunch is on screen")
               }
        }
        
        return result
    }
    
    func sendMessage(message: String, isForceNewChat: Bool) throws {
        HelpCrunch.sendMessage(text: message)
    }
    
    func logout() throws {
        HelpCrunch.logout { error in
            if let error = error {
                print("❌ onError::logout \(error)")
            } else {
                print("✅ onSuccess::logout")
            }
        }
    }
    
    private func bindTheme(theme: ThemeMessage?) {
        guard let theme = theme else { return }
        var hcTheme = HelpCrunch.currentTheme()
        if theme.chatAreaTheme?.brandingType == BrandingTypeMessage.dark {
            hcTheme = HelpCrunch.darkTheme()
        }
        
        if theme.chatAreaTheme?.brandingType == BrandingTypeMessage.light {
            hcTheme = HelpCrunch.lightTheme()
        }
        hcTheme.mainColor = UIColor(argb: UInt32(theme.primaryColor))
        
        hcTheme.sendMessageArea.sendButtonColor = UIColor(argb: UInt32(theme.primaryColor))
        
        if let bgColor = theme.messageAreaTheme?.backgroundColor {
            hcTheme.chats.backgroundColor = UIColor(argb: UInt32(bgColor))
        }
        
        // MARK: - Message Area
        if let chatAreaBgColor = theme.chatAreaTheme?.backgroundColor {
                hcTheme.chatArea.backgroundColor = UIColor(argb: UInt32(chatAreaBgColor))
        }
        if let incomingBubbleColor = theme.chatAreaTheme?.incomingBubbleColor {
                hcTheme.chatArea.messageIncomingBubbleColor = UIColor(argb: UInt32(incomingBubbleColor))
        }
        if let incomingTextColor = theme.chatAreaTheme?.incomingBubbleTextColor {
                hcTheme.chatArea.messageIncomingFontColor = UIColor(argb: UInt32(incomingTextColor))
        }
        if let outgoingBubbleColor = theme.chatAreaTheme?.outcomingBubbleColor {
                hcTheme.chatArea.messageOutgoingBubbleColor = UIColor(argb: UInt32(outgoingBubbleColor))
        }
        if let outgoingTextColor = theme.chatAreaTheme?.outcomingBubbleTextColor {
                hcTheme.chatArea.messageOutgoingFontColor = UIColor(argb: UInt32(outgoingTextColor))
        }

        if let timeTextColor = theme.chatAreaTheme?.timeTextColor {
                hcTheme.chatArea.messageTimeColor = UIColor(argb: UInt32(timeTextColor))
        }
        
        hcTheme.chatArea.messageOutgoingLinksColor = UIColor.blue
        
        ///


        // MARK: - Send Message Area
        if let sendMessageAreaBgColor = theme.messageAreaTheme?.backgroundColor {
            hcTheme.sendMessageArea.backgroundColor = UIColor(argb: UInt32(sendMessageAreaBgColor))
        }
        
        if let inputFieldTextColor = theme.messageAreaTheme?.inputFieldTextColor {
            hcTheme.sendMessageArea.textFieldFontColor = UIColor(argb: UInt32(inputFieldTextColor))
        }
        
        if let inputFieldTextHintColor = theme.messageAreaTheme?.inputFieldTextHintColor {
            hcTheme.sendMessageArea.textFieldPlaceholderColor = UIColor(argb: UInt32(inputFieldTextHintColor))
        }
        
        
        // MARK: - Pre-Chat Theme
        if let preChatThemeBgColor = theme.preChatTheme?.backgroundColor {
            hcTheme.prechatForm.backgroundColor = UIColor(argb: UInt32(preChatThemeBgColor))
        }
        
        if let preChatMessageBackgroundColor = theme.preChatTheme?.messageBackgroundColor {
            hcTheme.prechatForm.topMessageBackgroundColor = UIColor(argb: UInt32(preChatMessageBackgroundColor))
        }
        
        if let preChatMessageTextColor = theme.preChatTheme?.messageTextColor {
            hcTheme.prechatForm.topMessageFontColor = UIColor(argb: UInt32(preChatMessageTextColor))
        }
        
        
        // MARK: - Navigation Bar
        if let agentsMoreBackgroundColor = theme.toolbarAreaTheme?.agentsTextColor {
            hcTheme.navigationBar.agentsMoreBackgroundColor = UIColor(argb: UInt32(agentsMoreBackgroundColor))
        }
        
        if let navigationBgColor = theme.toolbarAreaTheme?.backgroundColor {
            hcTheme.navigationBar.backgroundColor = UIColor(argb: UInt32(navigationBgColor))
        }
        
        HelpCrunch.bindTheme(hcTheme)
    }
}
