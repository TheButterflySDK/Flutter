import Flutter
import UIKit
import TheButterflySDK

public class SwiftButterflySdkFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "TheButterflySdkFlutterPlugin", binaryMessenger: registrar.messenger())
    let instance = SwiftButterflySdkFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "openReporter":
            if let args = call.arguments as? [String: String], let apiKey = args["apiKey"] {
                ButterflySDK.openReporter(withKey: apiKey)
                result(true)
            } else {
                print("Butterfly error: missing API key")
                result(false)
            }
        case "useColor":
            if let args = call.arguments as? [String: String], let colorHexa = args["colorHexa"] {
                ButterflySDK.useCustomColor(colorHexa)
                result(true)
            } else {
                print("Butterfly error: missing argument 'colorHexa'")
                result(false)
            }
        case "overrideLanguage":
            if let args = call.arguments as? [String: String], let languageCode = args["languageCode"] as? String {
                ButterflySDK.overrideLanguage(languageCode)
                result(true)
            } else {
                print("Butterfly error: missing argument 'colorHexa'")
                result(false)
            }
        case "overrideCountry":
            if let args = call.arguments as? [String: String], let countryCode = args["countryCode"] {
                ButterflySDK.overrideCountry(countryCode)
                result(true)
            } else {
                print("Butterfly error: missing argument 'countryCode'")
                result(false)
            }
        default:
            print("Butterfly error: Unhandled method call")
            result(false)
        }
    }
}
