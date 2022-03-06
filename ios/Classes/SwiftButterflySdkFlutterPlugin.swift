import Flutter
import UIKit

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
                ButterflySdkFlutterPlugin.openReporter(withKey: apiKey)
            } else {
                result("Error: missing API key")
            }
        default:
            result("Error: Unhandled method call")
        }
  }
}
