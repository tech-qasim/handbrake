import 'package:handbrake/local_db/app_database.dart';

class StatsState {
  final DateTime selectedDate;
  final List<Relapse> relapseHistory;
  final DateTime focusedDate;
  StatsState({
    required this.selectedDate,
    required this.relapseHistory,
    required this.focusedDate,
  });

  StatsState copyWith({
    DateTime? selectedDate,
    List<Relapse>? relapseHistory,
    DateTime? focusedDate,
  }) {
    return StatsState(
      selectedDate: selectedDate ?? this.selectedDate,
      relapseHistory: relapseHistory ?? this.relapseHistory,
      focusedDate: focusedDate ?? this.focusedDate,
    );
  }

  factory StatsState.initial() {
    return StatsState(
      selectedDate: DateTime.now(),
      relapseHistory: [],
      focusedDate: DateTime.now(),
    );
  }
}
