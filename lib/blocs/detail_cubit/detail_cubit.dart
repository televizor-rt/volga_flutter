import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(const DetailState.init());
  void togglePanel() {
    switch(state.status) {
      case PanelStatus.init:
        emit(const DetailState.open());
        break;
      case PanelStatus.open:
        emit(const DetailState.closed());
        break;
      case PanelStatus.closed:
        emit(const DetailState.open());
        break;
    }
  }
}
