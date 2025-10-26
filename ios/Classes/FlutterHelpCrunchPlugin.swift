import Flutter
import UIKit
import HelpCrunchSDK

public class FlutterHelpCrunchPlugin: NSObject, FlutterPlugin, FlutterHelpCrunchApi {
    func initialize(configuration: ConfigurationMessage, user: UserMessage, theme: ThemeMessage?) throws {
        let configuration = HCSConfiguration(forOrganization: configuration.organization, applicationId: String(configuration.applicationId), applicationSecret: configuration.applicationSecret)
        
        let hcUser = HCSUser()
        hcUser.userId = user.id
        hcUser.email = user.email
        hcUser.phone = user.phone
        
        HelpCrunch.initWith(configuration, user: hcUser)
    }
    
    func updateUser(user: UserMessage) throws {
        let hcUser = HCSUser()
        hcUser.userId = user.id
        hcUser.email = user.email
        hcUser.phone = user.phone
        HelpCrunch.update(hcUser)
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
    
  public static func register(with registrar: FlutterPluginRegistrar) {
      let plugin = FlutterHelpCrunchPlugin()
      FlutterHelpCrunchApiSetup.setUp(binaryMessenger: registrar.messenger(), api: plugin)
      registrar.publish(plugin)
      registrar.addApplicationDelegate(plugin)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
