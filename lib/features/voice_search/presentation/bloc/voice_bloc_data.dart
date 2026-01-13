import 'package:equatable/equatable.dart';

// Events
abstract class VoiceEvent extends Equatable {
  const VoiceEvent();
  @override
  List<Object> get props => [];
}

class InitializeVoice extends VoiceEvent {}

class StartListening extends VoiceEvent {}

class StopListening extends VoiceEvent {}

// States
abstract class VoiceState extends Equatable {
  const VoiceState();
  @override
  List<Object> get props => [];
}

class VoiceInitial extends VoiceState {}

class VoiceReady extends VoiceState {}

class VoiceListening extends VoiceState {
  final String text;
  const VoiceListening(this.text);
  @override
  List<Object> get props => [text];
}

class VoiceSuccess extends VoiceState {
  final String finalResult;
  const VoiceSuccess(this.finalResult);
  @override
  List<Object> get props => [finalResult];
}

class VoiceError extends VoiceState {
  final String message;
  const VoiceError(this.message);
  @override
  List<Object> get props => [message];
}
