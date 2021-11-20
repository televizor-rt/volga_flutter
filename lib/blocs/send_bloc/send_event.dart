part of 'send_bloc.dart';

abstract class SendEvent extends Equatable {
  const SendEvent();
}

class ChooseSizeSendEvent extends SendEvent {
  final BoxSize size;

  const ChooseSizeSendEvent({required this.size});

  @override
  List<Object?> get props => [size];
}

class ChooseTransportSendEvent extends SendEvent {
  final TransportType type;
  final User user;

  const ChooseTransportSendEvent({required this.type, required this.user});

  @override
  List<Object?> get props => [type, user];
}

class CheckSendEvent extends SendEvent {
  final SendPack pack;

  const CheckSendEvent({required this.pack});

  @override
  List<Object?> get props => [pack];
}