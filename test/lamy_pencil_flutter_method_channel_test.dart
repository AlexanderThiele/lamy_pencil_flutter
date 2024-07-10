/*import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lamy_pencil_flutter/lamy_pencil_flutter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelLamyPencilFlutter platform = MethodChannelLamyPencilFlutter();
  const MethodChannel channel = MethodChannel('lamy_pencil_flutter');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
*/