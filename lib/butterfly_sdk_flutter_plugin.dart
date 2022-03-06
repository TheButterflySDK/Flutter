
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
    if (withKey == null) return false;
    if (withKey.isEmpty) return false;

    await _channel.invokeMethod('openReporter', {"apiKey": withKey});
    return true;
  }
}
