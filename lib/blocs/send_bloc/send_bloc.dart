import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'send_event.dart';
part 'send_state.dart';

class SendBloc extends Bloc<SendEvent, SendState> {
  SendBloc() : super(SendInitial()) {
    on<SendEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
