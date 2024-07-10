import 'package:lamy_pencil_flutter/entity/lamy_event.dart';
import 'package:lamy_pencil_flutter/lamy_pencil_flutter.dart';

class LamyPencilNoopImpl extends LamyPencilFlutter {
  @override
  Future<void> connect() async {}

  @override
  Future<void> disable() async {}

  @override
  Future<void> disconnect() async {}

  @override
  void dispose() {}

  @override
  Future<void> enable() async {}

  @override
  Future<int> getBattery() async {
    return -1;
  }

  @override
  Future<bool> isConnected() async {
    return false;
  }

  @override
  Future<bool> isEnabled() async {
    return false;
  }

  @override
  void listen(void Function(LamyEvent event) callback) {}
}
