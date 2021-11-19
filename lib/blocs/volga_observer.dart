import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

class VolgaObserver extends BlocObserver {
  final Logger logger;

  VolgaObserver({required this.logger});

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.d('${bloc.runtimeType} $change');
  }
}