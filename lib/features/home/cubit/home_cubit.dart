import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/home/cubit/home_state.dart';
import 'package:handbrake/local_db/app_database.dart';
import 'package:handbrake/utils/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void addRelapseOnOnboarding(DateTime relapseDateTime) async {
    final relapse = RelapsesCompanion(relapseTime: Value(relapseDateTime));
    final result = await getIt<AppDatabase>().relapseDao.insertRelapse(relapse);

    if (result != null) {
      emit(state.copyWith(relapses: [...state.relapses, result]));
    }

    await getIt<SharedPreferences>().setBool(
      SharedPrefStrings.isUserOnboarded,
      true,
    );
  }

  void addRelapse(
    DateTime relapseDateTime,
    String trigger,
    String emotion,
    double urgeIntensity,
  ) async {
    final relapse = RelapsesCompanion(
      relapseTime: Value(relapseDateTime),
      trigger: Value(trigger),
      emotion: Value(emotion),
      urgeIntensity: Value(urgeIntensity),
    );
    final result = await getIt<AppDatabase>().relapseDao.insertRelapse(relapse);

    if (result != null) {
      emit(
        state.copyWith(
          relapses: [...state.relapses, result],
          lastRelapseDate: result.relapseTime,
        ),
      );
      // setLastRelapseDateTime();
    }
  }

  void changeLastRelapseDate(DateTime dateTime) {
    emit(state.copyWith(lastRelapseDate: dateTime));
  }

  // Future<int?> getSoberCount() async {
  //   final lastRelapseTime = await getIt<AppDatabase>().relapseDao
  //       .getLastRelapse();

  //   if (lastRelapseTime != null) {
  //     final soberCount = DateTime.now()
  //         .difference(lastRelapseTime.relapseTime)
  //         .inDays;

  //     emit(state.copyWith(soberCount: soberCount));
  //     return soberCount;
  //   }
  //   return null;
  // }

  void setLastRelapseDateTime() async {
    final relapse = await getIt<AppDatabase>().relapseDao.getLastRelapse();
    emit(state.copyWith(lastRelapseDate: relapse?.relapseTime));
  }

  void startSoberTimer() {
    emit(
      state.copyWith(
        timer: Timer.periodic(
          const Duration(seconds: 1),
          (timer) => _onTick(timer),
        ),
      ),
    );
  }

  void _onTick(Timer timer) async {
    final relapse = state.lastRelapseDate;
    final updatedTime = DateTime.now().difference(relapse);
    setSoberTime(updatedTime);
  }

  void setSoberTime(Duration soberTime) {
    emit(state.copyWith(soberTime: soberTime));
  }

  void setTriggerChip(String? trigger) {
    emit(state.copyWith(selectedTriggerChip: () => trigger));
  }

  void setEmotionChip(String? emotion) {
    emit(state.copyWith(selectedEmotionChip: () => emotion));
  }

  void setUrgeIntensity(double val) {
    emit(state.copyWith(urgeIntensity: val));
  }

  void resetRelapseLog() {
    emit(
      state.copyWith(
        selectedEmotionChip: () => null,
        selectedTriggerChip: () => null,
      ),
    );
  }
}
