// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../pages/pages.dart' as _i2;
import '../pages/role/role.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    RoleScreenRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RoleScreen());
    },
    MainRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MainPage());
    },
    DetailsRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.DetailsPage());
    },
    TrainMasterRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.TrainMasterScreen());
    },
    TrackTabRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.TrackTab());
    },
    SendTabRouter.name: (routeData) {
      final args = routeData.argsAs<SendTabRouterArgs>(
          orElse: () => const SendTabRouterArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.SendTab(key: args.key));
    },
    TimeTableTabRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.TimeTableTab());
    },
    MapTabRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MapTab());
    },
    SchemaTabRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SchemaTab());
    },
    MyClaimsRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MyClaims());
    },
    MyDeparturesRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MyDepartures());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(RoleScreenRouter.name, path: '/'),
        _i3.RouteConfig(MainRoute.name, path: '/main-page', children: [
          _i3.RouteConfig(TrackTabRouter.name,
              path: '', parent: MainRoute.name),
          _i3.RouteConfig(SendTabRouter.name,
              path: 'send-tab', parent: MainRoute.name),
          _i3.RouteConfig(TimeTableTabRouter.name,
              path: 'time-table-tab', parent: MainRoute.name)
        ]),
        _i3.RouteConfig(DetailsRoute.name, path: '/details-page', children: [
          _i3.RouteConfig(MapTabRouter.name,
              path: 'map-tab', parent: DetailsRoute.name),
          _i3.RouteConfig(SchemaTabRouter.name,
              path: 'schema-tab', parent: DetailsRoute.name)
        ]),
        _i3.RouteConfig(TrainMasterRouter.name,
            path: '/train-master-screen',
            children: [
              _i3.RouteConfig(MyClaimsRouter.name,
                  path: '', parent: TrainMasterRouter.name),
              _i3.RouteConfig(MyDeparturesRouter.name,
                  path: 'my-departures', parent: TrainMasterRouter.name)
            ])
      ];
}

/// generated route for [_i1.RoleScreen]
class RoleScreenRouter extends _i3.PageRouteInfo<void> {
  const RoleScreenRouter() : super(name, path: '/');

  static const String name = 'RoleScreenRouter';
}

/// generated route for [_i2.MainPage]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute({List<_i3.PageRouteInfo>? children})
      : super(name, path: '/main-page', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for [_i2.DetailsPage]
class DetailsRoute extends _i3.PageRouteInfo<void> {
  const DetailsRoute({List<_i3.PageRouteInfo>? children})
      : super(name, path: '/details-page', initialChildren: children);

  static const String name = 'DetailsRoute';
}

/// generated route for [_i2.TrainMasterScreen]
class TrainMasterRouter extends _i3.PageRouteInfo<void> {
  const TrainMasterRouter({List<_i3.PageRouteInfo>? children})
      : super(name, path: '/train-master-screen', initialChildren: children);

  static const String name = 'TrainMasterRouter';
}

/// generated route for [_i2.TrackTab]
class TrackTabRouter extends _i3.PageRouteInfo<void> {
  const TrackTabRouter() : super(name, path: '');

  static const String name = 'TrackTabRouter';
}

/// generated route for [_i2.SendTab]
class SendTabRouter extends _i3.PageRouteInfo<SendTabRouterArgs> {
  SendTabRouter({_i4.Key? key})
      : super(name, path: 'send-tab', args: SendTabRouterArgs(key: key));

  static const String name = 'SendTabRouter';
}

class SendTabRouterArgs {
  const SendTabRouterArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'SendTabRouterArgs{key: $key}';
  }
}

/// generated route for [_i2.TimeTableTab]
class TimeTableTabRouter extends _i3.PageRouteInfo<void> {
  const TimeTableTabRouter() : super(name, path: 'time-table-tab');

  static const String name = 'TimeTableTabRouter';
}

/// generated route for [_i2.MapTab]
class MapTabRouter extends _i3.PageRouteInfo<void> {
  const MapTabRouter() : super(name, path: 'map-tab');

  static const String name = 'MapTabRouter';
}

/// generated route for [_i2.SchemaTab]
class SchemaTabRouter extends _i3.PageRouteInfo<void> {
  const SchemaTabRouter() : super(name, path: 'schema-tab');

  static const String name = 'SchemaTabRouter';
}

/// generated route for [_i2.MyClaims]
class MyClaimsRouter extends _i3.PageRouteInfo<void> {
  const MyClaimsRouter() : super(name, path: '');

  static const String name = 'MyClaimsRouter';
}

/// generated route for [_i2.MyDepartures]
class MyDeparturesRouter extends _i3.PageRouteInfo<void> {
  const MyDeparturesRouter() : super(name, path: 'my-departures');

  static const String name = 'MyDeparturesRouter';
}
