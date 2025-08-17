import 'package:handbrake/local_db/app_database.dart';

class StatsState {
  final DateTime selectedDate;
  final List<Relapse> relapseHistory;
  final List<CheckIn> checkins;
  final DateTime focusedDate;
  final Map<String, List<Relapse>> relapseHistoryMap;
  final Map<String, List<CheckIn>> checkinsHistoryMap;
  final DateTime chartSelectedDate;
  final Map<String, int> triggerCountMap;

  StatsState({
    required this.selectedDate,
    required this.relapseHistory,
    required this.checkins,
    required this.focusedDate,
    required this.relapseHistoryMap,
    required this.checkinsHistoryMap,
    required this.chartSelectedDate,
    required this.triggerCountMap,
  });

  StatsState copyWith({
    DateTime? selectedDate,
    List<Relapse>? relapseHistory,
    List<CheckIn>? checkins,
    DateTime? focusedDate,
    Map<String, List<Relapse>>? relapseHistoryMap,
    Map<String, List<CheckIn>>? checkinsHistoryMap,
    DateTime? chartSelectedDate,
    Map<String, int>? triggerCountMap,
  }) {
    return StatsState(
      selectedDate: selectedDate ?? this.selectedDate,
      relapseHistory: relapseHistory ?? this.relapseHistory,
      checkins: checkins ?? this.checkins,
      focusedDate: focusedDate ?? this.focusedDate,
      relapseHistoryMap: relapseHistoryMap ?? this.relapseHistoryMap,
      checkinsHistoryMap: checkinsHistoryMap ?? this.checkinsHistoryMap,
      chartSelectedDate: chartSelectedDate ?? this.chartSelectedDate,
      triggerCountMap: triggerCountMap ?? this.triggerCountMap,
    );
  }

  factory StatsState.initial() {
    return StatsState(
      selectedDate: DateTime.now(),
      relapseHistory: [],
      focusedDate: DateTime.now(),
      relapseHistoryMap: {},
      chartSelectedDate: DateTime.now(),
      triggerCountMap: {},
      checkins: [],
      checkinsHistoryMap: {},
    );
  }
}
