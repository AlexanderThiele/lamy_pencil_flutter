import 'package:equatable/equatable.dart';

sealed class LamyEvent extends Equatable {}

class LamyConnectionEvent extends LamyEvent {
  final LamyConnection connectionStatus;

  LamyConnectionEvent({required this.connectionStatus});

  @override
  List<Object?> get props => [connectionStatus];

  @override
  bool get stringify => true;
}

class LamyButtonEvent extends LamyEvent {
  final LamyButton button;
  final LamyButtonState state;

  LamyButtonEvent({
    required this.button,
    required this.state,
  });

  @override
  List<Object?> get props => [button, state];

  @override
  bool get stringify => true;
}

enum LamyConnection {
  connected,
  scanning,
  off,
  pairing,
  powerOff,
  disconnected,
  notSupported;
}

enum LamyButton { button1, button2 }

enum LamyButtonState { up, down }
