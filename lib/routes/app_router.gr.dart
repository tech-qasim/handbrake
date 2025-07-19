// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:handbrake/features/home/screens/counter/counter_screen.dart'
    as _i1;
import 'package:handbrake/features/home/screens/relapse_log/relapse_log_screen.dart'
    as _i7;
import 'package:handbrake/features/journal/screens/journal_entry/journal_entry_screen.dart'
    as _i3;
import 'package:handbrake/features/journal/screens/journal_view/journal_view_screen.dart'
    as _i4;
import 'package:handbrake/features/navigation/navigation_screen.dart' as _i6;
import 'package:handbrake/features/onboarding/screens/intro/intro_screen.dart'
    as _i2;
import 'package:handbrake/features/onboarding/screens/last_relapse/last_relapse_screen.dart'
    as _i5;
import 'package:handbrake/features/settings/screens/settings_screen.dart'
    as _i8;
import 'package:handbrake/features/splash/splash_screen.dart' as _i9;
import 'package:handbrake/features/stats/screens/stats_screen.dart' as _i10;
import 'package:handbrake/local_db/app_database.dart' as _i13;

/// generated route for
/// [_i1.CounterScreen]
class CounterRoute extends _i11.PageRouteInfo<void> {
  const CounterRoute({List<_i11.PageRouteInfo>? children})
    : super(CounterRoute.name, initialChildren: children);

  static const String name = 'CounterRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.CounterScreen();
    },
  );
}

/// generated route for
/// [_i2.IntroScreen]
class IntroRoute extends _i11.PageRouteInfo<void> {
  const IntroRoute({List<_i11.PageRouteInfo>? children})
    : super(IntroRoute.name, initialChildren: children);

  static const String name = 'IntroRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.IntroScreen();
    },
  );
}

/// generated route for
/// [_i3.JournalEntryScreen]
class JournalEntryRoute extends _i11.PageRouteInfo<JournalEntryRouteArgs> {
  JournalEntryRoute({
    _i12.Key? key,
    _i13.Journal? journalEntry,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         JournalEntryRoute.name,
         args: JournalEntryRouteArgs(key: key, journalEntry: journalEntry),
         initialChildren: children,
       );

  static const String name = 'JournalEntryRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<JournalEntryRouteArgs>(
        orElse: () => const JournalEntryRouteArgs(),
      );
      return _i3.JournalEntryScreen(
        key: args.key,
        journalEntry: args.journalEntry,
      );
    },
  );
}

class JournalEntryRouteArgs {
  const JournalEntryRouteArgs({this.key, this.journalEntry});

  final _i12.Key? key;

  final _i13.Journal? journalEntry;

  @override
  String toString() {
    return 'JournalEntryRouteArgs{key: $key, journalEntry: $journalEntry}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! JournalEntryRouteArgs) return false;
    return key == other.key && journalEntry == other.journalEntry;
  }

  @override
  int get hashCode => key.hashCode ^ journalEntry.hashCode;
}

/// generated route for
/// [_i4.JournalViewScreen]
class JournalViewRoute extends _i11.PageRouteInfo<void> {
  const JournalViewRoute({List<_i11.PageRouteInfo>? children})
    : super(JournalViewRoute.name, initialChildren: children);

  static const String name = 'JournalViewRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.JournalViewScreen();
    },
  );
}

/// generated route for
/// [_i5.LastRelapseScreen]
class LastRelapseRoute extends _i11.PageRouteInfo<void> {
  const LastRelapseRoute({List<_i11.PageRouteInfo>? children})
    : super(LastRelapseRoute.name, initialChildren: children);

  static const String name = 'LastRelapseRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.LastRelapseScreen();
    },
  );
}

/// generated route for
/// [_i6.NavigationScreen]
class NavigationRoute extends _i11.PageRouteInfo<void> {
  const NavigationRoute({List<_i11.PageRouteInfo>? children})
    : super(NavigationRoute.name, initialChildren: children);

  static const String name = 'NavigationRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.NavigationScreen();
    },
  );
}

/// generated route for
/// [_i7.RelapseLogScreen]
class RelapseLogRoute extends _i11.PageRouteInfo<void> {
  const RelapseLogRoute({List<_i11.PageRouteInfo>? children})
    : super(RelapseLogRoute.name, initialChildren: children);

  static const String name = 'RelapseLogRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.RelapseLogScreen();
    },
  );
}

/// generated route for
/// [_i8.SettingsScreen]
class SettingsRoute extends _i11.PageRouteInfo<void> {
  const SettingsRoute({List<_i11.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i9.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.SplashScreen();
    },
  );
}

/// generated route for
/// [_i10.StatsScreen]
class StatsRoute extends _i11.PageRouteInfo<void> {
  const StatsRoute({List<_i11.PageRouteInfo>? children})
    : super(StatsRoute.name, initialChildren: children);

  static const String name = 'StatsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.StatsScreen();
    },
  );
}
