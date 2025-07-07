// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:rama_otaqu/core/shared/models/destination_entity_model.dart'
    as _i7;
import 'package:rama_otaqu/modules/home/screens/home_screen.dart' as _i1;
import 'package:rama_otaqu/modules/intro/screens/intro_screen.dart' as _i2;
import 'package:rama_otaqu/modules/search_result/screens/search_result_screen.dart'
    as _i3;
import 'package:rama_otaqu/modules/splash/screens/splash_screen.dart' as _i4;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.IntroScreen]
class IntroRoute extends _i5.PageRouteInfo<void> {
  const IntroRoute({List<_i5.PageRouteInfo>? children})
    : super(IntroRoute.name, initialChildren: children);

  static const String name = 'IntroRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.IntroScreen();
    },
  );
}

/// generated route for
/// [_i3.SearchResultScreen]
class SearchResultRoute extends _i5.PageRouteInfo<SearchResultRouteArgs> {
  SearchResultRoute({
    _i6.Key? key,
    required _i7.DestinationEntityModel data,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         SearchResultRoute.name,
         args: SearchResultRouteArgs(key: key, data: data),
         initialChildren: children,
       );

  static const String name = 'SearchResultRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchResultRouteArgs>();
      return _i3.SearchResultScreen(key: args.key, data: args.data);
    },
  );
}

class SearchResultRouteArgs {
  const SearchResultRouteArgs({this.key, required this.data});

  final _i6.Key? key;

  final _i7.DestinationEntityModel data;

  @override
  String toString() {
    return 'SearchResultRouteArgs{key: $key, data: $data}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SearchResultRouteArgs) return false;
    return key == other.key && data == other.data;
  }

  @override
  int get hashCode => key.hashCode ^ data.hashCode;
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}
