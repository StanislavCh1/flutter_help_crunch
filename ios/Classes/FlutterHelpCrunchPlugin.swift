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
        hcUser.name = user.name
        hcUser.email = user.email
        hcUser.phone = user.phone
        bindTheme(theme: theme)
        HelpCrunchSDK.HelpCrunch.initWith(configuration, user: hcUser)
    }
    
    func updateUser(user: UserMessage) throws {
        let hcUser = HCSUser()
        hcUser.userId = user.id
        hcUser.name = user.name
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
        if let primaryColor = theme.primaryColor {
            let color = UIColor(argb: UInt32(primaryColor))
            hcTheme.mainColor = color
            hcTheme.sendMessageArea.sendButtonColor = color
        }
        
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
        if let authorNameColor = theme.chatAreaTheme?.authorNameColor {
            hcTheme.chatArea.messageIncomingAgentNameFontColor = UIColor(argb: UInt32(authorNameColor))
        }
        if let systemMessageColor = theme.chatAreaTheme?.systemMessageColor {
            hcTheme.chatArea.dateColor = UIColor(argb: UInt32(systemMessageColor))
        }
        if let progressViewsColor = theme.chatAreaTheme?.progressViewsColor {
            hcTheme.chatArea.waitingMessageActivityIndicatorColor = UIColor(argb: UInt32(progressViewsColor))
        }
        if let incomingCodeBg = theme.chatAreaTheme?.incomingCodeBackgroundColor {
            hcTheme.chatArea.messageIncomingCodeBackgroundColor = UIColor(argb: UInt32(incomingCodeBg))
        }
        if let outcomingCodeBg = theme.chatAreaTheme?.outcomingCodeBackgroundColor {
            hcTheme.chatArea.messageOutgoingCodeBackgroundColor = UIColor(argb: UInt32(outcomingCodeBg))
        }
        if let incomingCodeText = theme.chatAreaTheme?.incomingCodeTextColor {
            hcTheme.chatArea.messageIncomingCodeFontColor = UIColor(argb: UInt32(incomingCodeText))
        }
        if let outcomingCodeText = theme.chatAreaTheme?.outcomingCodeTextColor {
            hcTheme.chatArea.messageOutgoingCodeFontColor = UIColor(argb: UInt32(outcomingCodeText))
        }
        if let incomingBlockQuote = theme.chatAreaTheme?.incomingBlockQuoteColor {
            hcTheme.chatArea.messageIncomingQuoteLineColor = UIColor(argb: UInt32(incomingBlockQuote))
        }
        if let outcomingBlockQuote = theme.chatAreaTheme?.outcomingBlockQuoteColor {
            hcTheme.chatArea.messageOutgoingQuoteLineColor = UIColor(argb: UInt32(outcomingBlockQuote))
        }
        if let incomingFileColor = theme.chatAreaTheme?.incomingFileTextColor {
            hcTheme.chatArea.messageIncomingFileColor = UIColor(argb: UInt32(incomingFileColor))
        }
        if let outcomingFileColor = theme.chatAreaTheme?.outcomingFileTextColor {
            hcTheme.chatArea.messageOutgoingFileColor = UIColor(argb: UInt32(outcomingFileColor))
        }
        if let incomingLinkColor = theme.chatAreaTheme?.incomingBubbleLinkColor {
            hcTheme.chatArea.messageIncomingLinksColor = UIColor(argb: UInt32(incomingLinkColor))
        }
        if let outcomingLinkColor = theme.chatAreaTheme?.outcomingBubbleLinkColor {
            hcTheme.chatArea.messageOutgoingLinksColor = UIColor(argb: UInt32(outcomingLinkColor))
        }

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
        if let preChatInputTextColor = theme.preChatTheme?.inputFieldTextColor {
            hcTheme.prechatForm.textFieldFontColor = UIColor(argb: UInt32(preChatInputTextColor))
        }
        if let preChatInputHintColor = theme.preChatTheme?.inputFieldTextHintColor {
            hcTheme.prechatForm.textFieldPlaceholderColor = UIColor(argb: UInt32(preChatInputHintColor))
        }
        
        
        // MARK: - Navigation Bar
        if let agentsMoreBackgroundColor = theme.toolbarAreaTheme?.agentsTextColor {
            hcTheme.navigationBar.agentsMoreBackgroundColor = UIColor(argb: UInt32(agentsMoreBackgroundColor))
        }
        
        if let navigationBgColor = theme.toolbarAreaTheme?.backgroundColor {
            hcTheme.navigationBar.backgroundColor = UIColor(argb: UInt32(navigationBgColor))
        }
        if let outlineColor = theme.toolbarAreaTheme?.outlineColor {
            hcTheme.navigationBar.bottomLineColor = UIColor(argb: UInt32(outlineColor))
        }
        
        HelpCrunch.bindTheme(hcTheme)
    }
}
