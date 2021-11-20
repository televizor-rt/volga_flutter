part of 'send_bloc.dart';

abstract class SendEvent extends Equatable {
  const SendEvent();
}

class InitSendEvent extends SendEvent {
  const InitSendEvent();

  @override
  List<Object?> get props => [];
}

class ChooseSizeSendEvent extends SendEvent {
  final BoxSize size;

  const ChooseSizeSendEvent({required this.size});

  @override
  List<Object?> get props => [size];
}

class ChooseTransportSendEvent extends SendEvent {
  final TransportType type;
  final User addressee;
  final User sender;

  const ChooseTransportSendEvent({
    required this.type,
    required this.addressee,
    required this.sender,
  });

  @override
  List<Object?> get props => [type, sender, addressee];
}

class CheckSendEvent extends SendEvent {
  final SendPack pack;

  const CheckSendEvent({required this.pack});

  @override
  List<Object?> get props => [pack];
}
