// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:handbrake/features/home/screens/home_screen.dart' as _i1;
import 'package:handbrake/features/journal/screens/journal_screen.dart' as _i3;
import 'package:handbrake/features/navigation/navigation_screen.dart' as _i5;
import 'package:handbrake/features/onboarding/screens/intro/intro_screen.dart'
    as _i2;
import 'package:handbrake/features/onboarding/screens/last_relapse/last_relapse_screen.dart'
    as _i4;
import 'package:handbrake/features/settings/screens/settings_screen.dart'
    as _i6;
import 'package:handbrake/features/stats/screens/stats_screen.dart' as _i7;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.IntroScreen]
class IntroRoute extends _i8.PageRouteInfo<void> {
  const IntroRoute({List<_i8.PageRouteInfo>? children})
    : super(IntroRoute.name, initialChildren: children);

  static const String name = 'IntroRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.IntroScreen();
    },
  );
}

/// generated route for
/// [_i3.JournalScreen]
class JournalRoute extends _i8.PageRouteInfo<void> {
  const JournalRoute({List<_i8.PageRouteInfo>? children})
    : super(JournalRoute.name, initialChildren: children);

  static const String name = 'JournalRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.JournalScreen();
    },
  );
}

/// generated route for
/// [_i4.LastRelapseScreen]
class LastRelapseRoute extends _i8.PageRouteInfo<void> {
  const LastRelapseRoute({List<_i8.PageRouteInfo>? children})
    : super(LastRelapseRoute.name, initialChildren: children);

  static const String name = 'LastRelapseRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.LastRelapseScreen();
    },
  );
}

/// generated route for
/// [_i5.NavigationScreen]
class NavigationRoute extends _i8.PageRouteInfo<void> {
  const NavigationRoute({List<_i8.PageRouteInfo>? children})
    : super(NavigationRoute.name, initialChildren: children);

  static const String name = 'NavigationRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.NavigationScreen();
    },
  );
}

/// generated route for
/// [_i6.SettingsScreen]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute({List<_i8.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i7.StatsScreen]
class StatsRoute extends _i8.PageRouteInfo<void> {
  const StatsRoute({List<_i8.PageRouteInfo>? children})
    : super(StatsRoute.name, initialChildren: children);

  static const String name = 'StatsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.StatsScreen();
    },
  );
}
