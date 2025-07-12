import 'package:handbrake/local_db/app_database.dart';

class HomeState {
  List<Relapse> relapses;
  DateTime lastRelapseDate;
  HomeState({required this.relapses, required this.lastRelapseDate});
  factory HomeState.initial() {
    return HomeState(relapses: [], lastRelapseDate: DateTime.now());
  }

  HomeState copyWith({List<Relapse>? relapses, DateTime? lastRelapseDate}) {
    return HomeState(
      relapses: relapses ?? this.relapses,
      lastRelapseDate: lastRelapseDate ?? this.lastRelapseDate,
    );
  }
}
