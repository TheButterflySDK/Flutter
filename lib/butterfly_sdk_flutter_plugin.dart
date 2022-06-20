import 'dart:async';

import 'package:flutter/services.dart';

class ButterflySdk {

  static const MethodChannel _channel =
      const MethodChannel('TheButterflySdkFlutterPlugin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool?> openReporter({required String withKey}) async {
    bool didSucceed = false;

    if (withKey == null) return didSucceed;
    if (withKey.isEmpty) return didSucceed;

    didSucceed = await _channel.invokeMethod('openReporter', {"apiKey": withKey});

    return didSucceed;
  }

  // static Future<bool?> colorize({required Color color}) async {
  //   bool? result = await useColor(colorHexa: color.toString());
  //   return result;
  // }

  static Future<bool?> useColor({required String colorHexa}) async {
    bool didSucceed = false;
    if (colorHexa == null) return didSucceed;
    if (colorHexa.isEmpty) return didSucceed;

    didSucceed = await _channel.invokeMethod('useColor', {"colorHexa": colorHexa});

    return didSucceed;
  }

  static Future<bool?> overrideLanguage({required String supportedLanguage}) async {
    bool didSucceed = false;
    if (supportedLanguage == null) return didSucceed;
    if (supportedLanguage.length != 2) return didSucceed;

    didSucceed = await _channel.invokeMethod('overrideLanguage', {"languageCode": supportedLanguage});

    return didSucceed;
  }

  /// Sets  a two letters country code to override the country regardless of the user's location.
  static Future<bool?> overrideCountry({required String countryCode}) async {
    bool didSucceed = false;
    if (countryCode.length != 2) return didSucceed;

    didSucceed = await _channel.invokeMethod('overrideCountry', {"countryCode": countryCode});

    return didSucceed;
  }
}
