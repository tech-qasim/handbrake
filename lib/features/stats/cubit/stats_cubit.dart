import 'package:flutter/material.dart';
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

  Future<void> getRelapseHistoryByMonth(String monthYear) async {
    final relapseHistory = await getIt<AppDatabase>().relapseDao
        .getRelapsesByMonth(monthYear);

    emit(state.copyWith(relapseHistory: relapseHistory));
    groupRelapsesByMonth();
  }

  void setFocusedDate(DateTime datetime) {
    debugPrint("Emitting focused date: $datetime");
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

  void getTriggerCount() {
    final monthYear =
        "${state.chartSelectedDate.year}-${state.chartSelectedDate.month}";

    if (!state.relapseHistoryMap.containsKey(monthYear)) {
      getRelapseHistoryByMonth(monthYear);
    }

    final relapses = state.relapseHistoryMap[monthYear] ?? [];
    final Map<String, int> triggerCountMap = {};

    for (final relapse in relapses) {
      final trigger = relapse.trigger;

      if (trigger != null) {
        if (trigger.isNotEmpty) {
          if (triggerCountMap.containsKey(trigger)) {
            final counter = triggerCountMap[trigger] ?? 0;
            triggerCountMap[trigger] = counter + 1;
          } else {
            triggerCountMap[trigger] = 1;
          }
        }
      }
    }

    emit(state.copyWith(triggerCountMap: triggerCountMap));
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

  void goToPreviousMonth(DateTime firstRelapseTime) {
    if (state.chartSelectedDate.isBefore(
      DateTime(firstRelapseTime.year, firstRelapseTime.month + 1),
    )) {
      return;
    }

    emit(
      state.copyWith(
        chartSelectedDate: DateTime(
          state.chartSelectedDate.year,
          state.chartSelectedDate.month - 1,
        ),
      ),
    );

    print('previous month : ${state.chartSelectedDate}');
  }

  void goToNextMonth() {
    emit(
      state.copyWith(
        chartSelectedDate: DateTime(
          state.chartSelectedDate.year,
          state.chartSelectedDate.month + 1,
        ),
      ),
    );

    print('next month : ${state.chartSelectedDate}');
  }
}
