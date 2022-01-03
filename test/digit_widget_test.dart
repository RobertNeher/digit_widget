import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digit_widget/digit_widget.dart';

void main() {
  const MethodChannel channel = MethodChannel('digit_widget');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DigitWidget.platformVersion, '42');
  });
}
