part of 'send_bloc.dart';

abstract class SendState extends Equatable {
  final SendPack sendPack;
  const SendState({required this.sendPack});
}

class SendLoadingState extends SendState {
  const SendLoadingState({
    required SendPack sendPack,
  }) : super(sendPack: sendPack);

  @override
  List<Object> get props => [sendPack];
}


class ChooseSizeState extends SendState {
  final List<BoxSize> sizes;
  final String title;

  const ChooseSizeState({
    required SendPack sendPack,
    required this.sizes,
    required this.title,
  }) : super(sendPack: sendPack);

  @override
  String toString() => 'TransportationState { title: $title }';

  @override
  List<Object> get props => [sizes, title, sendPack];
}

class TransportationState extends SendState {
  final List<TransportType> types;
  final String title;

  const TransportationState({
    required SendPack sendPack,
    required this.types,
    required this.title,
  }) : super(sendPack: sendPack);

  @override
  String toString() => 'TransportationState { title: $title }';

  @override
  List<Object?> get props => [types, title, sendPack];
}

class CheckState extends SendState {
  final String title;

  const CheckState({
    required SendPack sendPack,
    required this.title,
  }) : super(sendPack: sendPack);

  @override
  String toString() => 'TransportationState { title: $title }';

  @override
  List<Object?> get props => [title, sendPack];
}