// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:collection/collection.dart' as _i18;
import 'package:flutter/cupertino.dart' as _i17;
import 'package:flutter/material.dart' as _i15;
import 'package:handbrake/features/achievements/screens/achievements_screen.dart'
    as _i1;
import 'package:handbrake/features/home/screens/counter/counter_screen.dart'
    as _i2;
import 'package:handbrake/features/home/screens/relapse_log/relapse_log_screen.dart'
    as _i10;
import 'package:handbrake/features/journal/screens/journal_entry/journal_entry_screen.dart'
    as _i4;
import 'package:handbrake/features/journal/screens/journal_view/journal_view_screen.dart'
    as _i5;
import 'package:handbrake/features/navigation/navigation_screen.dart' as _i7;
import 'package:handbrake/features/onboarding/screens/intro/intro_screen.dart'
    as _i3;
import 'package:handbrake/features/onboarding/screens/last_relapse/last_relapse_screen.dart'
    as _i6;
import 'package:handbrake/features/onboarding/screens/reason/reason_screen.dart'
    as _i8;
import 'package:handbrake/features/settings/screens/settings_screen.dart'
    as _i11;
import 'package:handbrake/features/splash/splash_screen.dart' as _i12;
import 'package:handbrake/features/stats/screens/relapse_date/relapse_date_screen.dart'
    as _i9;
import 'package:handbrake/features/stats/screens/stats_screen.dart' as _i13;
import 'package:handbrake/local_db/app_database.dart' as _i16;

/// generated route for
/// [_i1.AchievementsScreen]
class AchievementsRoute extends _i14.PageRouteInfo<void> {
  const AchievementsRoute({List<_i14.PageRouteInfo>? children})
    : super(AchievementsRoute.name, initialChildren: children);

  static const String name = 'AchievementsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.AchievementsScreen();
    },
  );
}

/// generated route for
/// [_i2.CounterScreen]
class CounterRoute extends _i14.PageRouteInfo<void> {
  const CounterRoute({List<_i14.PageRouteInfo>? children})
    : super(CounterRoute.name, initialChildren: children);

  static const String name = 'CounterRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.CounterScreen();
    },
  );
}

/// generated route for
/// [_i3.IntroScreen]
class IntroRoute extends _i14.PageRouteInfo<void> {
  const IntroRoute({List<_i14.PageRouteInfo>? children})
    : super(IntroRoute.name, initialChildren: children);

  static const String name = 'IntroRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.IntroScreen();
    },
  );
}

/// generated route for
/// [_i4.JournalEntryScreen]
class JournalEntryRoute extends _i14.PageRouteInfo<JournalEntryRouteArgs> {
  JournalEntryRoute({
    _i15.Key? key,
    _i16.Journal? journalEntry,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         JournalEntryRoute.name,
         args: JournalEntryRouteArgs(key: key, journalEntry: journalEntry),
         initialChildren: children,
       );

  static const String name = 'JournalEntryRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<JournalEntryRouteArgs>(
        orElse: () => const JournalEntryRouteArgs(),
      );
      return _i4.JournalEntryScreen(
        key: args.key,
        journalEntry: args.journalEntry,
      );
    },
  );
}

class JournalEntryRouteArgs {
  const JournalEntryRouteArgs({this.key, this.journalEntry});

  final _i15.Key? key;

  final _i16.Journal? journalEntry;

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
/// [_i5.JournalViewScreen]
class JournalViewRoute extends _i14.PageRouteInfo<void> {
  const JournalViewRoute({List<_i14.PageRouteInfo>? children})
    : super(JournalViewRoute.name, initialChildren: children);

  static const String name = 'JournalViewRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.JournalViewScreen();
    },
  );
}

/// generated route for
/// [_i6.LastRelapseScreen]
class LastRelapseRoute extends _i14.PageRouteInfo<void> {
  const LastRelapseRoute({List<_i14.PageRouteInfo>? children})
    : super(LastRelapseRoute.name, initialChildren: children);

  static const String name = 'LastRelapseRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.LastRelapseScreen();
    },
  );
}

/// generated route for
/// [_i7.NavigationScreen]
class NavigationRoute extends _i14.PageRouteInfo<void> {
  const NavigationRoute({List<_i14.PageRouteInfo>? children})
    : super(NavigationRoute.name, initialChildren: children);

  static const String name = 'NavigationRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.NavigationScreen();
    },
  );
}

/// generated route for
/// [_i8.ReasonScreen]
class ReasonRoute extends _i14.PageRouteInfo<ReasonRouteArgs> {
  ReasonRoute({
    _i17.Key? key,
    String? reason,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         ReasonRoute.name,
         args: ReasonRouteArgs(key: key, reason: reason),
         initialChildren: children,
       );

  static const String name = 'ReasonRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReasonRouteArgs>(
        orElse: () => const ReasonRouteArgs(),
      );
      return _i8.ReasonScreen(key: args.key, reason: args.reason);
    },
  );
}

class ReasonRouteArgs {
  const ReasonRouteArgs({this.key, this.reason});

  final _i17.Key? key;

  final String? reason;

  @override
  String toString() {
    return 'ReasonRouteArgs{key: $key, reason: $reason}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReasonRouteArgs) return false;
    return key == other.key && reason == other.reason;
  }

  @override
  int get hashCode => key.hashCode ^ reason.hashCode;
}

/// generated route for
/// [_i9.RelapseDateScreen]
class RelapseDateRoute extends _i14.PageRouteInfo<RelapseDateRouteArgs> {
  RelapseDateRoute({
    _i15.Key? key,
    required String date,
    required List<_i16.Relapse> relapses,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         RelapseDateRoute.name,
         args: RelapseDateRouteArgs(key: key, date: date, relapses: relapses),
         initialChildren: children,
       );

  static const String name = 'RelapseDateRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RelapseDateRouteArgs>();
      return _i9.RelapseDateScreen(
        key: args.key,
        date: args.date,
        relapses: args.relapses,
      );
    },
  );
}

class RelapseDateRouteArgs {
  const RelapseDateRouteArgs({
    this.key,
    required this.date,
    required this.relapses,
  });

  final _i15.Key? key;

  final String date;

  final List<_i16.Relapse> relapses;

  @override
  String toString() {
    return 'RelapseDateRouteArgs{key: $key, date: $date, relapses: $relapses}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RelapseDateRouteArgs) return false;
    return key == other.key &&
        date == other.date &&
        const _i18.ListEquality().equals(relapses, other.relapses);
  }

  @override
  int get hashCode =>
      key.hashCode ^ date.hashCode ^ const _i18.ListEquality().hash(relapses);
}

/// generated route for
/// [_i10.RelapseLogScreen]
class RelapseLogRoute extends _i14.PageRouteInfo<void> {
  const RelapseLogRoute({List<_i14.PageRouteInfo>? children})
    : super(RelapseLogRoute.name, initialChildren: children);

  static const String name = 'RelapseLogRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.RelapseLogScreen();
    },
  );
}

/// generated route for
/// [_i11.SettingsScreen]
class SettingsRoute extends _i14.PageRouteInfo<void> {
  const SettingsRoute({List<_i14.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i12.SplashScreen]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashScreen();
    },
  );
}

/// generated route for
/// [_i13.StatsScreen]
class StatsRoute extends _i14.PageRouteInfo<void> {
  const StatsRoute({List<_i14.PageRouteInfo>? children})
    : super(StatsRoute.name, initialChildren: children);

  static const String name = 'StatsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.StatsScreen();
    },
  );
}
