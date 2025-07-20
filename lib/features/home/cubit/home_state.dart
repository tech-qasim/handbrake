import 'dart:async';

import 'package:handbrake/local_db/app_database.dart';

class HomeState {
  List<Relapse> relapses;
  DateTime lastRelapseDate;
  DateTime firstRelapseDate;
  int soberCount;
  Timer? timer;
  Duration soberTime;
  String? selectedTriggerChip;
  String? selectedEmotionChip;
  double urgeIntensity;
  HomeState({
    required this.relapses,
    required this.lastRelapseDate,
    required this.soberCount,
    required this.timer,
    required this.soberTime,
    required this.selectedTriggerChip,
    this.selectedEmotionChip,
    required this.urgeIntensity,
    required this.firstRelapseDate,
  });
  factory HomeState.initial() {
    return HomeState(
      relapses: [],
      lastRelapseDate: DateTime.now(),
      soberCount: 0,
      timer: null,
      soberTime: Duration.zero,
      selectedTriggerChip: null,
      selectedEmotionChip: null,
      urgeIntensity: 1,
      firstRelapseDate: DateTime.now(),
    );
  }

  HomeState copyWith({
    List<Relapse>? relapses,
    DateTime? lastRelapseDate,
    int? soberCount,
    Timer? timer,
    Duration? soberTime,
    String? Function()? selectedTriggerChip,
    String? Function()? selectedEmotionChip,
    double? urgeIntensity,
    DateTime? firstRelapseDate,
  }) {
    return HomeState(
      relapses: relapses ?? this.relapses,
      lastRelapseDate: lastRelapseDate ?? this.lastRelapseDate,
      soberCount: soberCount ?? this.soberCount,
      timer: timer ?? this.timer,
      soberTime: soberTime ?? this.soberTime,
      selectedTriggerChip: selectedTriggerChip != null
          ? selectedTriggerChip()
          : this.selectedTriggerChip,
      selectedEmotionChip: selectedEmotionChip != null
          ? selectedEmotionChip()
          : this.selectedEmotionChip,
      urgeIntensity: urgeIntensity ?? this.urgeIntensity,
      firstRelapseDate: firstRelapseDate ?? this.firstRelapseDate,
    );
  }
}
