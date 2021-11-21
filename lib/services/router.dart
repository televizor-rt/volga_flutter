import 'package:auto_route/annotations.dart';
import 'package:volga/pages/pages.dart';
import 'package:volga/pages/role/role.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: RoleScreen, name: 'RoleScreenRouter', initial: true),
    AutoRoute(page: MainPage, children: [
      AutoRoute(
        name: 'TrackTabRouter',
        page: TrackTab,
        initial: true,
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
    AutoRoute(page: TrainMasterScreen, name: 'TrainMasterRouter', children: [
      AutoRoute(
        name: 'MyClaimsRouter',
        page: MyClaims,
        initial: true,
      ),
      AutoRoute(
        name: 'MyDeparturesRouter',
        page: MyDepartures,
      ),
    ]),
  ],
)
class $AppRouter {}
