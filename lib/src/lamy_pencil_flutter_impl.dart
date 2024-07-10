import 'package:flutter/services.dart';
import 'package:lamy_pencil_flutter/entity/lamy_event.dart';
import 'package:lamy_pencil_flutter/lamy_pencil_flutter.dart';

class LamyPencilFlutterImpl extends LamyPencilFlutter {
  late final platform = const MethodChannel('dev.thiele/lamy');

  @override
  Future<bool> isConnected() async {
    return await platform.invokeMethod<bool>('isConnected') ?? false;
  }

  @override
  Future<bool> isEnabled() async {
    return await platform.invokeMethod<bool>('isEnabled') ?? false;
  }

  @override
  Future<int> getBattery() async {
    return await platform.invokeMethod('getBattery') ?? -1;
  }

  @override
  Future<void> enable() async {
    await platform.invokeMethod('enable');
  }

  @override
  Future<void> disable() async {
    await platform.invokeMethod('disable');
  }

  @override
  Future<void> connect() async {
    await platform.invokeMethod('connect');
  }

  @override
  Future<void> disconnect() async {
    await platform.invokeMethod('disconnect');
  }

  @override
  void listen(void Function(LamyEvent event) callback) {
    platform.setMethodCallHandler(
      (call) async {
        switch (call.method) {
          case "lamyConnection":
            switch (call.arguments) {
              case "connected":
                callback(LamyConnectionEvent(connectionStatus: LamyConnection.connected));
                break;
              case "scanning":
                callback(LamyConnectionEvent(connectionStatus: LamyConnection.scanning));
                break;
              case "off":
                callback(LamyConnectionEvent(connectionStatus: LamyConnection.off));
                break;
              case "pairing":
                callback(LamyConnectionEvent(connectionStatus: LamyConnection.pairing));
                break;
              case "powerOff":
                callback(LamyConnectionEvent(connectionStatus: LamyConnection.powerOff));
                break;
              case "disconnected":
                callback(LamyConnectionEvent(connectionStatus: LamyConnection.disconnected));
                break;
              case "notSupported":
                callback(LamyConnectionEvent(connectionStatus: LamyConnection.notSupported));
                break;
            }
            break;
          case "button1":
            switch (call.arguments) {
              case "down":
                callback(LamyButtonEvent(button: LamyButton.button1, state: LamyButtonState.down));
                break;
              case "up":
                callback(LamyButtonEvent(button: LamyButton.button1, state: LamyButtonState.up));
                break;
              default:
                print("Got an event that is not supported: ${call.method}, ${call.arguments}");
                break;
            }
            break;
          case "button2":
            switch (call.arguments) {
              case "down":
                callback(LamyButtonEvent(button: LamyButton.button2, state: LamyButtonState.up));
                break;
              case "up":
                callback(LamyButtonEvent(button: LamyButton.button2, state: LamyButtonState.down));
                break;
              default:
                print("Got an event that is not supported: ${call.method}, ${call.arguments}");
                break;
            }
            break;
          default:
            print("Got an event that is not supported: ${call.method}, ${call.arguments}");
        }
      },
    );
  }

  @override
  void dispose() {
    platform.setMethodCallHandler(null);
  }
}
