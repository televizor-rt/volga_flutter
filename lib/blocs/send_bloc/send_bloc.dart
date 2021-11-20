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
            mainTitle: 'Отправить посылку',
          ),
        ) {
    on<SendEvent>((event, emit) {
      on<InitSendEvent>(_onInitSendEvent);
      on<ChooseSizeSendEvent>(_onChooseSizeSendEvent);
      on<ChooseTransportSendEvent>(_onChooseTransportSendEvent);
      on<CheckSendEvent>(_onCheckSendEvent);
    });
  }

  void _onInitSendEvent(SendEvent event, Emitter<SendState> emit) {
    event as InitSendEvent;
    emit(ChooseSizeState(
      sendPack: const SendPack(),
      sizes: volgaRepository.boxSizes,
      title: 'Размер посылки',
      mainTitle: 'Отправить посылку',
    ));
  }

  void _onChooseSizeSendEvent(SendEvent event, Emitter<SendState> emit) {
    event as ChooseSizeSendEvent;
    emit(TransportationState(
      sendPack: SendPack(
        sender: state.sendPack.sender,
        addressee: state.sendPack.addressee,
        size: event.size,
        type: state.sendPack.type,
      ),
      title: 'Способ перевозки',
      mainTitle: 'Отправить посылку',
      types: volgaRepository.transportTypes,
    ));
  }

  void _onChooseTransportSendEvent(SendEvent event, Emitter<SendState> emit) {
    event as ChooseTransportSendEvent;
    emit(CheckState(
      sendPack: SendPack(
        sender: event.sender,
        addressee: event.addressee,
        size: state.sendPack.size,
        type: event.type,
      ),
      title: 'Способ перевозки',
      mainTitle: 'Проверьте данные',
    ));
  }

  void _onCheckSendEvent(SendEvent event, Emitter<SendState> emit) {
    emit(CloseState(
      sendPack: state.sendPack,
      title: 'Заявка на рассмотрении',
      mainTitle: '',
    ));
  }
}
