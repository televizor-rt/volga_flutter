part of 'send_bloc.dart';

abstract class SendState extends Equatable {
  const SendState();
}

class SendInitial extends SendState {
  @override
  List<Object> get props => [];
}
