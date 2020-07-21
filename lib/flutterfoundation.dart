import 'dart:async';

import 'package:flutter/services.dart';

class Flutterfoundation {
  static const MethodChannel _channel =
      const MethodChannel('flutterfoundation');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
