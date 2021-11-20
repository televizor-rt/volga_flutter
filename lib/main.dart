import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:volga/services/locator.dart';

import 'blocs/blocs.dart';
import 'services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locatorSetup();
  BlocOverrides.runZoned(
    () => runApp(MyApp()),
    blocObserver: VolgaObserver(
      logger: getIt<Logger>(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = getIt<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => getIt<DetailCubit>()),
        BlocProvider(create: (BuildContext context) => getIt<SendBloc>()),
      ],
      child: MaterialApp.router(
        theme: VolgaTheme.theme,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(
          navigatorObservers: () => <NavigatorObserver>[],
        ),
      ),
    );
  }
}
