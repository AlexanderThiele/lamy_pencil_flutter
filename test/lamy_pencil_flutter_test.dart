/*import 'package:flutter_test/flutter_test.dart';
import 'package:lamy_pencil_flutter/lamy_pencil_flutter.dart';
import 'package:lamy_pencil_flutter/lamy_pencil_flutter_platform_interface.dart';
import 'package:lamy_pencil_flutter/lamy_pencil_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLamyPencilFlutterPlatform
    with MockPlatformInterfaceMixin
    implements LamyPencilFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LamyPencilFlutterPlatform initialPlatform = LamyPencilFlutterPlatform.instance;

  test('$MethodChannelLamyPencilFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLamyPencilFlutter>());
  });

  test('getPlatformVersion', () async {
    LamyPencilFlutter lamyPencilFlutterPlugin = LamyPencilFlutter();
    MockLamyPencilFlutterPlatform fakePlatform = MockLamyPencilFlutterPlatform();
    LamyPencilFlutterPlatform.instance = fakePlatform;

    expect(await lamyPencilFlutterPlugin.getPlatformVersion(), '42');
  });
}
*/