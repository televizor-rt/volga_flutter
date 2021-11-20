part of 'send_bloc.dart';

abstract class SendState extends Equatable {
  final SendPack sendPack;
  final String title;
  final String mainTitle;
  const SendState({
    required this.sendPack,
    required this.title,
    required this.mainTitle,
  });
}

class SendLoadingState extends SendState {
  const SendLoadingState({
    required SendPack sendPack,
  }) : super(
          sendPack: sendPack,
          title: 'Loading',
          mainTitle: 'Loading',
        );

  @override
  List<Object> get props => [sendPack];
}

class ChooseSizeState extends SendState {
  final List<BoxSize> sizes;
  const ChooseSizeState({
    required SendPack sendPack,
    required this.sizes,
    required String title,
    required String mainTitle,
  }) : super(
          sendPack: sendPack,
          title: title,
          mainTitle: mainTitle,
        );

  @override
  String toString() => 'ChooseSizeState { title: $title }';

  @override
  List<Object> get props => [sizes, title, sendPack];
}

class TransportationState extends SendState {
  final List<TransportType> types;

  const TransportationState({
    required SendPack sendPack,
    required this.types,
    required String title,
    required String mainTitle,
  }) : super(
          sendPack: sendPack,
          title: title,
          mainTitle: mainTitle,
        );

  @override
  String toString() => 'TransportationState { title: $title }';

  @override
  List<Object?> get props => [types, title, sendPack];
}

class CheckState extends SendState {
  const CheckState({
    required SendPack sendPack,
    required String title,
    required String mainTitle,
  }) : super(
          sendPack: sendPack,
          title: title,
          mainTitle: mainTitle,
        );

  @override
  String toString() => 'CheckState { title: $title }';

  @override
  List<Object?> get props => [title, sendPack];
}

class CloseState extends SendState {
  const CloseState({
    required SendPack sendPack,
    required String title,
    required String mainTitle,
  }) : super(
    sendPack: sendPack,
    title: title,
    mainTitle: mainTitle,
  );

  @override
  String toString() => 'CloseState { title: $title }';

  @override
  List<Object?> get props => [title, sendPack];
}
