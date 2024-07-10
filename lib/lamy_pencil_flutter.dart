import 'dart:io';

import 'package:lamy_pencil_flutter/entity/lamy_event.dart';
import 'package:lamy_pencil_flutter/src/lamy_pencil_flutter_impl.dart';
import 'package:lamy_pencil_flutter/src/lamy_pencil_noop_impl.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class LamyPencilFlutter extends PlatformInterface {
  LamyPencilFlutter() : super(token: _token);

  static final Object _token = Object();

  static LamyPencilFlutter _instance = LamyPencilFlutterImpl();
  static final LamyPencilFlutter _instanceNoop = LamyPencilNoopImpl();

  static LamyPencilFlutter get instance {
    if (Platform.isIOS) {
      return _instance;
    }
    return _instanceNoop;
  }

  static set instance(LamyPencilFlutter instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<bool> isConnected();

  Future<bool> isEnabled();

  Future<int> getBattery();

  Future<void> enable();

  Future<void> disable();

  Future<void> connect();

  Future<void> disconnect();

  void listen(void Function(LamyEvent event) callback);

  void dispose();
}
