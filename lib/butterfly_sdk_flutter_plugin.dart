import 'dart:async';

import 'package:flutter/services.dart';

class ButterflySdk {
  // Singleton
  static ButterflySdk? _instance;
  static ButterflySdk get shared => _instance ??= ButterflySdk._();
  static ButterflySdk get instance => shared;

  ButterflySdk._() { }

  factory ButterflySdk.create() {
    return shared;
  }

  factory ButterflySdk() {
    return shared;
  }

  static const MethodChannel _channel =
      const MethodChannel('TheButterflySdkFlutterPlugin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool?> openReporter({required String withKey}) async {
    return ButterflySdk.shared.open(withKey: withKey);
  }

  Future<bool?> open({required String withKey}) async {
    bool didSucceed = false;
    if (withKey.isEmpty) return didSucceed;

    didSucceed = await _channel.invokeMethod('openReporter', {"apiKey": withKey});

    return didSucceed;
  }

  Future<bool?> useColor({required String colorHexa}) async {
    bool didSucceed = false;
    if (colorHexa.isEmpty) return didSucceed;

    didSucceed = await _channel.invokeMethod('useColor', {"colorHexa": colorHexa});

    return didSucceed;
  }

  Future<bool?> overrideLanguage({required String supportedLanguage}) async {
    bool didSucceed = false;
    if (supportedLanguage.length != 2) return didSucceed;

    didSucceed = await _channel.invokeMethod('overrideLanguage', {"languageCode": supportedLanguage});

    return didSucceed;
  }

  /// Sets  a two letters country code to override the country regardless of the user's location.
  Future<bool?> overrideCountry({required String countryCode}) async {
    bool didSucceed = false;
    if (countryCode.length != 2) return didSucceed;

    didSucceed = await _channel.invokeMethod('overrideCountry', {"countryCode": countryCode});

    return didSucceed;
  }

  /**
   * In case you app handles deep links, use this API for forwarding the link to The Butterfly Button SDK as well.
   */
  Future<bool?> handleDeepLink({required String linkString, required String apiKey}) async {
    bool didSucceed = false;
    if (linkString.length < 2 || linkString.length > 1000) return didSucceed;
    if (apiKey.isEmpty) return didSucceed;

    didSucceed = await _channel.invokeMethod('handleDeepLink', {"linkString": linkString, "apiKey": apiKey});

    return didSucceed;
  }
}
