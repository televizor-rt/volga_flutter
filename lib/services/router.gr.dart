// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../pages/pages.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    DetailsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DetailsPage());
    },
    TrackTabRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.TrackTab());
    },
    SendTabRouter.name: (routeData) {
      final args = routeData.argsAs<SendTabRouterArgs>(
          orElse: () => const SendTabRouterArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.SendTab(key: args.key));
    },
    TimeTableTabRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.TimeTableTab());
    },
    MapTabRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MapTab());
    },
    SchemaTabRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SchemaTab());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(MainRoute.name, path: '/', children: [
          _i2.RouteConfig(TrackTabRouter.name,
              path: 'track-tab', parent: MainRoute.name),
          _i2.RouteConfig(SendTabRouter.name,
              path: 'send-tab', parent: MainRoute.name),
          _i2.RouteConfig(TimeTableTabRouter.name,
              path: 'time-table-tab', parent: MainRoute.name)
        ]),
        _i2.RouteConfig(DetailsRoute.name, path: '/details-page', children: [
          _i2.RouteConfig(MapTabRouter.name,
              path: 'map-tab', parent: DetailsRoute.name),
          _i2.RouteConfig(SchemaTabRouter.name,
              path: 'schema-tab', parent: DetailsRoute.name)
        ])
      ];
}

/// generated route for [_i1.MainPage]
class MainRoute extends _i2.PageRouteInfo<void> {
  const MainRoute({List<_i2.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for [_i1.DetailsPage]
class DetailsRoute extends _i2.PageRouteInfo<void> {
  const DetailsRoute({List<_i2.PageRouteInfo>? children})
      : super(name, path: '/details-page', initialChildren: children);

  static const String name = 'DetailsRoute';
}

/// generated route for [_i1.TrackTab]
class TrackTabRouter extends _i2.PageRouteInfo<void> {
  const TrackTabRouter() : super(name, path: 'track-tab');

  static const String name = 'TrackTabRouter';
}

/// generated route for [_i1.SendTab]
class SendTabRouter extends _i2.PageRouteInfo<SendTabRouterArgs> {
  SendTabRouter({_i3.Key? key})
      : super(name, path: 'send-tab', args: SendTabRouterArgs(key: key));

  static const String name = 'SendTabRouter';
}

class SendTabRouterArgs {
  const SendTabRouterArgs({this.key});

  final _i3.Key? key;

  @override
  String toString() {
    return 'SendTabRouterArgs{key: $key}';
  }
}

/// generated route for [_i1.TimeTableTab]
class TimeTableTabRouter extends _i2.PageRouteInfo<void> {
  const TimeTableTabRouter() : super(name, path: 'time-table-tab');

  static const String name = 'TimeTableTabRouter';
}

/// generated route for [_i1.MapTab]
class MapTabRouter extends _i2.PageRouteInfo<void> {
  const MapTabRouter() : super(name, path: 'map-tab');

  static const String name = 'MapTabRouter';
}

/// generated route for [_i1.SchemaTab]
class SchemaTabRouter extends _i2.PageRouteInfo<void> {
  const SchemaTabRouter() : super(name, path: 'schema-tab');

  static const String name = 'SchemaTabRouter';
}
