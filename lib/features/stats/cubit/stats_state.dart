import 'package:handbrake/local_db/app_database.dart';

class StatsState {
  final DateTime selectedDate;
  final List<Relapse> relapseHistory;
  StatsState({required this.selectedDate, required this.relapseHistory});

  StatsState copyWith({DateTime? selectedDate, List<Relapse>? relapseHistory}) {
    return StatsState(
      selectedDate: selectedDate ?? this.selectedDate,
      relapseHistory: relapseHistory ?? this.relapseHistory,
    );
  }

  factory StatsState.initial() {
    return StatsState(selectedDate: DateTime.now(), relapseHistory: []);
  }
}
