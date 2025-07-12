// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:handbrake/features/onboarding/screens/intro/intro_screen.dart'
    as _i1;
import 'package:handbrake/features/onboarding/screens/last_relapse/last_relapse_screen.dart'
    as _i2;

/// generated route for
/// [_i1.IntroScreen]
class IntroRoute extends _i3.PageRouteInfo<void> {
  const IntroRoute({List<_i3.PageRouteInfo>? children})
    : super(IntroRoute.name, initialChildren: children);

  static const String name = 'IntroRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.IntroScreen();
    },
  );
}

/// generated route for
/// [_i2.LastRelapseScreen]
class LastRelapseRoute extends _i3.PageRouteInfo<void> {
  const LastRelapseRoute({List<_i3.PageRouteInfo>? children})
    : super(LastRelapseRoute.name, initialChildren: children);

  static const String name = 'LastRelapseRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.LastRelapseScreen();
    },
  );
}
