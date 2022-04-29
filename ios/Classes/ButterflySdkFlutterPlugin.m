#import "ButterflySdkFlutterPlugin.h"
#if __has_include(<butterfly_sdk_flutter_plugin/butterfly_sdk_flutter_plugin-Swift.h>)
#import <butterfly_sdk_flutter_plugin/butterfly_sdk_flutter_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "butterfly_sdk_flutter_plugin-Swift.h"
#endif

#import "TheButterflySDK.h"

@implementation ButterflySdkFlutterPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftButterflySdkFlutterPlugin registerWithRegistrar:registrar];
}

@end
