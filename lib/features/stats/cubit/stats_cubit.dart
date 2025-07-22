import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/data_constants.dart';
import 'package:handbrake/features/stats/cubit/stats_state.dart';
import 'package:handbrake/local_db/app_database.dart';
import 'package:handbrake/utils/di.dart';

class StatsCubit extends Cubit<StatsState> {
  StatsCubit() : super(StatsState.initial());

  void setSelectedDate(DateTime date) {
    emit(state.copyWith(selectedDate: date));
  }

  void getRelapseHistoryByMonth(String monthYear) async {
    final relapseHistory = await getIt<AppDatabase>().relapseDao
        .getRelapsesByMonth(monthYear);

    emit(state.copyWith(relapseHistory: relapseHistory));
    groupRelapsesByMonth();
  }

  void setFocusedDate(DateTime datetime) {
    print("Emitting focused date: $datetime");
    emit(state.copyWith(focusedDate: datetime));
  }

  void groupRelapsesByMonth() {
    final Map<String, List<Relapse>> groupedRelapses = state.relapseHistoryMap;

    for (final relapse in state.relapseHistory) {
      final key = relapse.monthYear;

      if (!groupedRelapses.containsKey(key)) {
        groupedRelapses[key] = [];
      }
      groupedRelapses[key]!.add(relapse);
    }

    emit(state.copyWith(relapseHistoryMap: groupedRelapses));
  }

  void addRelapseToRelapseHistoryMap(Relapse relapse) {
    final updatedMap = Map<String, List<Relapse>>.from(state.relapseHistoryMap);

    final todayRelapseHistory = List<Relapse>.from(
      updatedMap[todayMonthYear] ?? [],
    );

    todayRelapseHistory.add(relapse);
    updatedMap[todayMonthYear] = todayRelapseHistory;

    emit(state.copyWith(relapseHistoryMap: updatedMap));
  }
}
