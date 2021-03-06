import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:volga/blocs/blocs.dart';
import 'package:volga/repository/repository.dart';
import 'package:volga/services/services.dart';

final GetIt getIt = GetIt.I;

Future locatorSetup() async {
  // Blocs
  getIt.registerFactory<DetailCubit>(
    () => DetailCubit(),
  );
  getIt.registerFactory<TrackCubit>(
    () => TrackCubit(),
  );
  getIt.registerFactory<SendBloc>(() => SendBloc(volgaRepository: getIt()));
  // Repository
  getIt.registerLazySingleton<VolgaRepository>(() => VolgaRepositoryImpl());
  // Services
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => Logger());
}
