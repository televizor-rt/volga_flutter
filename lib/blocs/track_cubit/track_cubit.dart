import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'track_state.dart';

class TrackCubit extends Cubit<TrackState> {
  TrackCubit() : super(TrackMapState());

  void showMap() {
    emit(TrackMapState());
  }

  void showFromMe() {
    emit(TrackFromMeState());
  }

  void showMine() {
    emit(TrackMineState());
  }

  void showAll() {
    emit(TrackAllState());
  }
}
