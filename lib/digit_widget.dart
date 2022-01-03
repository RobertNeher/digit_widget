
import 'dart:async';

import 'package:flutter/services.dart';

class DigitWidget {
  static const MethodChannel _channel = MethodChannel('digit_widget');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
