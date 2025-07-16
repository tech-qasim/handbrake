import 'package:flutter_bloc/flutter_bloc.dart';
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
  }
}
