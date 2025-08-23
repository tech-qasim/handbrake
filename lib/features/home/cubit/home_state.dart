import 'dart:async';

import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/local_db/app_database.dart';

class HomeState {
  List<Relapse> relapses;
  List<CheckIn> checkIns;
  DateTime lastRelapseDate;
  DateTime firstRelapseDate;
  int soberCount;
  Timer? timer;
  Duration soberTime;
  String? selectedTriggerChip;
  String? selectedEmotionChip;
  double urgeIntensity;
  int longestStreakinSeconds;
  int blessingCount;
  List<String> triggers;
  String urgeStartedReasons;
  String reason;
  CheckIn? latestCheckIn;
  int onboardingIndex;
  String relapseTime;
  String isResistUrge;
  List<String> actions;
  HomeState({
    required this.relapses,
    required this.checkIns,
    required this.lastRelapseDate,
    required this.firstRelapseDate,
    required this.soberCount,
    required this.timer,
    required this.soberTime,
    required this.selectedTriggerChip,
    this.selectedEmotionChip,
    required this.urgeIntensity,
    required this.longestStreakinSeconds,
    required this.blessingCount,
    required this.triggers,
    required this.urgeStartedReasons,
    required this.reason,
    required this.latestCheckIn,
    required this.onboardingIndex,
    required this.relapseTime,
    required this.isResistUrge,
    required this.actions,
  });
  factory HomeState.initial() {
    return HomeState(
      actions: [],
      urgeStartedReasons: '',
      isResistUrge: '',
      relapseTime: '',
      onboardingIndex: 0,
      relapses: [],
      lastRelapseDate: DateTime.now(),
      soberCount: 0,
      timer: null,
      soberTime: Duration.zero,
      selectedTriggerChip: null,
      selectedEmotionChip: null,
      urgeIntensity: 1,
      firstRelapseDate: DateTime.now(),
      longestStreakinSeconds: 0,
      blessingCount: 0,
      triggers: triggersData,
      reason: '',
      checkIns: [],
      latestCheckIn: null,
    );
  }

  HomeState copyWith({
    List<Relapse>? relapses,
    List<CheckIn>? checkIns,
    DateTime? lastRelapseDate,
    DateTime? firstRelapseDate,
    int? soberCount,
    Timer? timer,
    Duration? soberTime,
    String? selectedTriggerChip,
    String? selectedEmotionChip,
    double? urgeIntensity,
    int? longestStreakinSeconds,
    int? blessingCount,
    List<String>? triggers,
    String? urgeStartedReasons,
    String? reason,
    CheckIn? latestCheckIn,
    int? onboardingIndex,
    String? relapseTime,
    String? isResistUrge,
    List<String>? actions,
  }) {
    return HomeState(
      relapses: relapses ?? this.relapses,
      checkIns: checkIns ?? this.checkIns,
      lastRelapseDate: lastRelapseDate ?? this.lastRelapseDate,
      firstRelapseDate: firstRelapseDate ?? this.firstRelapseDate,
      soberCount: soberCount ?? this.soberCount,
      timer: timer ?? this.timer,
      soberTime: soberTime ?? this.soberTime,
      selectedTriggerChip: selectedTriggerChip ?? this.selectedTriggerChip,
      selectedEmotionChip: selectedEmotionChip ?? this.selectedEmotionChip,
      urgeIntensity: urgeIntensity ?? this.urgeIntensity,
      longestStreakinSeconds:
          longestStreakinSeconds ?? this.longestStreakinSeconds,
      blessingCount: blessingCount ?? this.blessingCount,
      triggers: triggers ?? this.triggers,
      urgeStartedReasons: urgeStartedReasons ?? this.urgeStartedReasons,
      reason: reason ?? this.reason,
      latestCheckIn: latestCheckIn ?? this.latestCheckIn,
      onboardingIndex: onboardingIndex ?? this.onboardingIndex,
      relapseTime: relapseTime ?? this.relapseTime,
      isResistUrge: isResistUrge ?? this.isResistUrge,
      actions: actions ?? this.actions,
    );
  }
}
