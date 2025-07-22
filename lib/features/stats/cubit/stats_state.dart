import 'package:handbrake/local_db/app_database.dart';

class StatsState {
  final DateTime selectedDate;
  final List<Relapse> relapseHistory;
  final DateTime focusedDate;
  final Map<String, List<Relapse>> relapseHistoryMap;
  StatsState({
    required this.selectedDate,
    required this.relapseHistory,
    required this.focusedDate,
    required this.relapseHistoryMap,
  });

  StatsState copyWith({
    DateTime? selectedDate,
    List<Relapse>? relapseHistory,
    DateTime? focusedDate,
    Map<String, List<Relapse>>? relapseHistoryMap,
  }) {
    return StatsState(
      selectedDate: selectedDate ?? this.selectedDate,
      relapseHistory: relapseHistory ?? this.relapseHistory,
      focusedDate: focusedDate ?? this.focusedDate,
      relapseHistoryMap: relapseHistoryMap ?? this.relapseHistoryMap,
    );
  }

  factory StatsState.initial() {
    return StatsState(
      selectedDate: DateTime.now(),
      relapseHistory: [],
      focusedDate: DateTime.now(),
      relapseHistoryMap: {},
    );
  }
}
