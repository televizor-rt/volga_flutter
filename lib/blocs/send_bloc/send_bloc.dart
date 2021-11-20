import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:volga/models/models.dart';
import 'package:volga/repository/repository.dart';

part 'send_event.dart';
part 'send_state.dart';

class SendBloc extends Bloc<SendEvent, SendState> {
  final VolgaRepository volgaRepository;
  SendBloc({
    required this.volgaRepository,
  }) : super(
    ChooseSizeState(
            sendPack: const SendPack(),
            sizes: volgaRepository.boxSizes,
            title: 'Размер посылки',
          ),
        ) {
    on<SendEvent>((event, emit) {
      on<ChooseSizeSendEvent>(_onChooseSizeSendEvent);
      on<ChooseTransportSendEvent>(_onChooseTransportSendEvent);
    });
  }

  void _onChooseSizeSendEvent(SendEvent event, Emitter<SendState> emit) {
    event as ChooseSizeSendEvent;
    emit(TransportationState(
      sendPack: SendPack(
        user: state.sendPack.user,
        size: event.size,
        type: state.sendPack.type,
      ),
      title: 'Способ перевозки',
      types: volgaRepository.transportTypes,
    ));
  }

  void _onChooseTransportSendEvent(SendEvent event, Emitter<SendState> emit) {
    event as ChooseTransportSendEvent;
    emit(CheckState(
      sendPack: SendPack(
        user: event.user,
        size: state.sendPack.size,
        type: event.type,
      ),
      title: 'Способ перевозки',
    ));
  }
}
