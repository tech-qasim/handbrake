import 'package:handbrake/local_db/app_database.dart';

class StatsState {
  final DateTime selectedDate;
  final List<Relapse> relapseHistory;
  final DateTime focusedDate;
  final Map<String, List<Relapse>> relapseHistoryMap;
  final DateTime chartSelectedDate;
  final Map<String, int> triggerCountMap;

  StatsState({
    required this.selectedDate,
    required this.relapseHistory,
    required this.focusedDate,
    required this.relapseHistoryMap,
    required this.chartSelectedDate,
    required this.triggerCountMap,
  });

  StatsState copyWith({
    DateTime? selectedDate,
    List<Relapse>? relapseHistory,
    DateTime? focusedDate,
    Map<String, List<Relapse>>? relapseHistoryMap,
    DateTime? chartSelectedDate,
    Map<String, int>? triggerCountMap,
  }) {
    return StatsState(
      selectedDate: selectedDate ?? this.selectedDate,
      relapseHistory: relapseHistory ?? this.relapseHistory,
      focusedDate: focusedDate ?? this.focusedDate,
      relapseHistoryMap: relapseHistoryMap ?? this.relapseHistoryMap,
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
    );
  }
}
