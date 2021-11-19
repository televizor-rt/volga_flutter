import 'package:auto_route/annotations.dart';
import 'package:volga/pages/pages.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainPage, initial: true, children: [
      AutoRoute(
        name: 'TrackTabRouter',
        page: TrackTab,
      ),
      AutoRoute(
        name: 'SendTabRouter',
        page: SendTab,
      ),
      AutoRoute(
        name: 'TimeTableTabRouter',
        page: TimeTableTab,
      ),
    ]),
    AutoRoute(page: DetailsPage, children: [
      AutoRoute(
        name: 'MapTabRouter',
        page: MapTab,
      ),
      AutoRoute(
        name: 'SchemaTabRouter',
        page: SchemaTab,
      ),
    ]),
  ],
)
class $AppRouter {}        