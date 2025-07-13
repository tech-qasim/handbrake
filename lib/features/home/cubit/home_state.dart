import 'dart:async';

import 'package:handbrake/local_db/app_database.dart';

class HomeState {
  List<Relapse> relapses;
  DateTime lastRelapseDate;
  int soberCount;
  Timer? timer;
  Duration soberTime;
  HomeState({
    required this.relapses,
    required this.lastRelapseDate,
    required this.soberCount,
    required this.timer,
    required this.soberTime,
  });
  factory HomeState.initial() {
    return HomeState(
      relapses: [],
      lastRelapseDate: DateTime.now(),
      soberCount: 0,
      timer: null,
      soberTime: Duration.zero,
    );
  }

  HomeState copyWith({
    List<Relapse>? relapses,
    DateTime? lastRelapseDate,
    int? soberCount,
    Timer? timer,
    Duration? soberTime,
  }) {
    return HomeState(
      relapses: relapses ?? this.relapses,
      lastRelapseDate: lastRelapseDate ?? this.lastRelapseDate,
      soberCount: soberCount ?? this.soberCount,
      timer: timer ?? this.timer,
      soberTime: soberTime ?? this.soberTime,
    );
  }
}
