import 'dart:async';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/home/cubit/home_state.dart';
import 'package:handbrake/features/stats/cubit/stats_cubit.dart';
import 'package:handbrake/local_db/app_database.dart';
import 'package:handbrake/models/award.dart';
import 'package:handbrake/services/notification_service.dart';
import 'package:handbrake/theme/app_colors.dart';
import 'package:handbrake/utils/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeCubit extends Cubit<HomeState> {
  final StatsCubit statsCubit;
  HomeCubit(this.statsCubit) : super(HomeState.initial());

  void addRelapseOnOnboarding(DateTime relapseDateTime) async {
    final reason = state.reason;
    final relapse = RelapsesCompanion(
      relapseTime: Value(relapseDateTime),
      day: Value(relapseDateTime.day),
      monthYear: Value("${relapseDateTime.year}-${relapseDateTime.month}"),
    );
    final result = await getIt<AppDatabase>().relapseDao.insertRelapse(relapse);

    if (result != null) {
      emit(state.copyWith(relapses: [...state.relapses, result]));
      getIt<NotificationService>().scheduleDailyReminders();
      getIt<NotificationService>().scheduleDailyReminders(
        title:
            "✨ Reason Reminder so you don't forget why you started this journey.",
        body: reason,
        bigTextTitle:
            "✨ Reason Reminder so you don't forget why you started this journey.",
        bigTextContent: reason,
        notificationId: NotificationsIds.reasonReminderId,
      );
      initializeTimer();
      scheduleNotificationsOnOnboarding();
      giveAwardOnOnboarding();

      final newCheckIn = CheckInsCompanion(
        date: Value(relapseDateTime),
        isClean: const Value(false),
        day: Value(relapseDateTime.day),
        monthYear: Value("${relapseDateTime.year}-${relapseDateTime.month}"),
      );

      final response = await getIt<AppDatabase>().checkInDao.insertCheckIn(
        newCheckIn,
      );

      if (response != null) {
        statsCubit.addCheckinToCheckinHistoryMap(response);
      }
    }

    await getIt<SharedPreferences>().setBool(
      SharedPrefStrings.isUserOnboarded,
      true,
    );
  }

  int? loadLongestStreak() {
    int? recentStreak =
        getIt<SharedPreferences>().getInt(SharedPrefStrings.longestStreak) ?? 0;
    return recentStreak;
  }

  Future<CheckIn?> addCheckIn(DateTime checkInTime, bool isClean) async {
    final newCheckIn = CheckInsCompanion(
      date: Value(checkInTime),
      isClean: Value(isClean),
      day: Value(checkInTime.day),
      monthYear: Value("${checkInTime.year}-${checkInTime.month}"),
    );

    final result = await getIt<AppDatabase>().checkInDao.insertCheckIn(
      newCheckIn,
    );
    if (result != null) {
      emit(
        state.copyWith(
          checkIns: [...state.checkIns, result],
          latestCheckIn: result,
        ),
      );

      statsCubit.addCheckinToCheckinHistoryMap(result);

      return result;
    }

    return null;
  }

  void getCheckInByDay(DateTime datetime) async {
    final day = datetime.day;
    final monthYear = "${datetime.year}-${datetime.month}";

    final result = await getIt<AppDatabase>().checkInDao
        .getCheckInByDayAndMonthYear(day, monthYear);

    if (result != null) {
      emit(state.copyWith(latestCheckIn: result));
    }
  }

  void addRelapse(
    DateTime relapseDateTime,
    String trigger,
    String emotion,
    double urgeIntensity,
  ) async {
    final date = DateTime.now();
    final relapse = RelapsesCompanion(
      relapseTime: Value(relapseDateTime),
      trigger: Value(trigger),
      emotion: Value(emotion),
      urgeIntensity: Value(urgeIntensity),
      day: Value(date.day),
      monthYear: Value("${date.year}-${date.month}"),
    );

    final result = await getIt<AppDatabase>().relapseDao.insertRelapse(relapse);

    await _addUpdateCheckInOnRelapse(date);

    if (result != null) {
      emit(state.copyWith(lastRelapseDate: result.relapseTime));

      resetAndRescheduleNotifications();
      statsCubit.addRelapseToRelapseHistoryMap(result);
      statsCubit.getTriggerCount();
      // setLastRelapseDateTime();
    }
  }

  Future<void> _addUpdateCheckInOnRelapse(DateTime date) async {
    final checkIn = await getIt<AppDatabase>().checkInDao
        .getCheckInByDayAndMonthYear(date.day, "${date.year}-${date.month}");

    if (checkIn == null) {
      addCheckIn(date, false);
    } else {
      final updatedLatestCheckin = state.latestCheckIn;
      if (updatedLatestCheckin != null) {
        final result = await getIt<AppDatabase>().checkInDao.updateCheckIn(
          updatedLatestCheckin.copyWith(isClean: false),
        );
        if (result) {
          emit(
            state.copyWith(
              latestCheckIn: updatedLatestCheckin.copyWith(isClean: false),
            ),
          );

          statsCubit.updateCheckinHistoryMap(
            updatedLatestCheckin.copyWith(isClean: false),
          );
        }
      }
    }
  }

  void scheduleNotificationsOnOnboarding() {
    for (int i = 0; i < awards.length; i++) {
      final id = NotificationsIds.awardId + i;
      final result = isAwardAchievedOnOnboarding(awards[i]);
      if (!result) {
        getIt<NotificationService>().scheduleRewardNotifications(
          awards[i].title,
          awards[i].daysRequired,
          id,
        );
      }
    }
  }

  void scheduleAwardNotifications() {
    for (int i = 0; i < awards.length; i++) {
      final id = NotificationsIds.awardId + i;
      final result = isAwardAchieved(awards[i]);
      if (!result) {
        getIt<NotificationService>().scheduleRewardNotifications(
          awards[i].title,
          awards[i].daysRequired,
          id,
        );
      }
    }
  }

  bool isAwardAchievedOnOnboarding(Award award) {
    final relapse = state.lastRelapseDate;
    final todayDate = DateTime.now();
    final currentStreak = todayDate.difference(relapse).inDays;

    if (award.daysRequired <= currentStreak) {
      return true;
    }

    return false;
  }

  Future<void> resetAndRescheduleNotifications() async {
    cancelAwardNotifications();
    scheduleAwardNotifications();
  }

  void changeLastRelapseDate(DateTime dateTime) {
    emit(state.copyWith(lastRelapseDate: dateTime));
  }

  void cancelAwardNotifications() {
    for (int i = 0; i < awards.length; i++) {
      final id = NotificationsIds.awardId + i;
      final result = isAwardAchieved(awards[i]);
      if (!result) {
        getIt<NotificationService>().cancelNotifications(id);
      }
    }
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

  Future<void> setLastRelapseDateOnAppStart() async {
    final relapse = await getIt<AppDatabase>().relapseDao.getLastRelapse();
    debugPrint("last relapse : ${relapse?.relapseTime}");
    emit(state.copyWith(lastRelapseDate: relapse?.relapseTime));
  }

  void setLastRelapseDate(DateTime date) {
    emit(state.copyWith(lastRelapseDate: date));
  }

  Future<void> initializeTimer() async {
    setFirstRelapseDateTime();
    await setLastRelapseDateOnAppStart();
    await getLongestStreak();
    startSoberTimer();
  }

  Future<int> getLongestStreak() async {
    final relapse = state.lastRelapseDate;
    final todayDate = DateTime.now();
    final currentStreak = todayDate.difference(relapse).inDays;

    debugPrint("longest streak");

    final longestStreak =
        getIt<SharedPreferences>().getInt(SharedPrefStrings.longestStreak) ?? 0;

    if (currentStreak > longestStreak) {
      getIt<SharedPreferences>().setInt(
        SharedPrefStrings.longestStreak,
        currentStreak,
      ); //storing in days

      emit(state.copyWith(longestStreakinSeconds: currentStreak.toSeconds));
    } else {
      emit(state.copyWith(longestStreakinSeconds: longestStreak.toSeconds));
    }

    return currentStreak;
  }

  void setFirstRelapseDateTime() async {
    final relapse = await getIt<AppDatabase>().relapseDao.getFirstRelapse();
    emit(state.copyWith(firstRelapseDate: relapse?.relapseTime));
    print(relapse?.relapseTime);
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
    final updatedSoberTime = DateTime.now().difference(relapse);

    final currentStreakInSeconds = updatedSoberTime.inSeconds;
    final previousLongestInSeconds = state.longestStreakinSeconds;

    final updatedLongestInSeconds =
        currentStreakInSeconds > previousLongestInSeconds
        ? currentStreakInSeconds
        : previousLongestInSeconds;

    setSoberTimeAndLongestStreak(updatedSoberTime, updatedLongestInSeconds);
  }

  void setSoberTimeAndLongestStreak(Duration soberTime, int updatedLongest) {
    emit(
      state.copyWith(
        soberTime: soberTime,
        longestStreakinSeconds: updatedLongest,
      ),
    );
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
    getTriggers();
  }

  Award? getNextAward() {
    final longestStreak = state.longestStreakinSeconds.toDays;

    for (Award award in awards) {
      if (longestStreak < award.daysRequired) {
        return award;
      }
    }

    return null;
  }

  Future<void> checkAndShowAchievementDialog(BuildContext context) async {
    final prefs = getIt<SharedPreferences>();
    final longestStreak = state.longestStreakinSeconds.toDays;

    final mostRecentAward = awards.lastWhereOrNull(
      (day) => day.daysRequired <= longestStreak,
    );

    if (mostRecentAward == null) {
      return;
    }

    final lastShown =
        prefs.getString(SharedPrefStrings.lastAchievedAward) ?? '';

    if (context.mounted && lastShown != mostRecentAward.title) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: AppColors.whiteColor,
          title: const Text("🎉 Award Unlocked!"),
          content: Text("You’ve unlocked: ${mostRecentAward.title}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Awesome!"),
            ),
          ],
        ),
      );

      await prefs.setString(
        SharedPrefStrings.lastAchievedAward,
        mostRecentAward.title,
      );
    }
  }

  bool isAwardAchieved(Award award) {
    final longestStreak = state.longestStreakinSeconds.toDays;

    if (award.daysRequired <= longestStreak) {
      return true;
    }

    return false;
  }

  void giveDailyBlessing() async {
    final prefs = getIt<SharedPreferences>();
    final lastRewardTime = prefs.getString(SharedPrefStrings.lastRewardTime);
    final now = DateTime.now();
    final lastReward = lastRewardTime != null
        ? DateTime.tryParse(lastRewardTime)
        : null;

    if (lastReward == null || now.difference(lastReward).inHours >= 24) {
      final blessingCount = prefs.getInt(SharedPrefStrings.blessingCount) ?? 0;
      prefs.setInt(SharedPrefStrings.blessingCount, blessingCount + 2);
      prefs.setString(SharedPrefStrings.lastRewardTime, now.toString());
      emit(state.copyWith(blessingCount: blessingCount + 2));
      debugPrint('✅ 2 coins added. New balance: ${blessingCount + 2}');
    } else {
      debugPrint('⏳ Reward already claimed. Try again later.');
    }
  }

  Future<int> getBlessingCount() async {
    final prefs = getIt<SharedPreferences>();
    final blessings = prefs.getInt(SharedPrefStrings.blessingCount) ?? 0;
    emit(state.copyWith(blessingCount: blessings));
    return blessings;
  }

  void giveAwardOnOnboarding() {
    final lastRelapseDate = state.lastRelapseDate;
    final cleanDays = DateTime.now().difference(lastRelapseDate).inDays;
    final prefs = getIt<SharedPreferences>();
    final blessingPerDay = 2;
    final totalBlessingOnOnboarding = cleanDays * blessingPerDay;
    prefs.setInt(SharedPrefStrings.blessingCount, totalBlessingOnOnboarding);
    prefs.setString(
      SharedPrefStrings.lastRewardTime,
      DateTime.now().toString(),
    );
    emit(state.copyWith(blessingCount: totalBlessingOnOnboarding));
  }

  void addNewTrigger(String trigger) async {
    final result = await getIt<AppDatabase>().relapseDao.addNewTrigger(
      TriggersCompanion(trigger: Value(trigger)),
    );

    if (result != null) {
      emit(state.copyWith(triggers: [...state.triggers, trigger]));
    }
  }

  void getTriggers() async {
    if (state.triggers.length <= 5) {
      final triggerList = await getIt<AppDatabase>().relapseDao.getTriggers();
      List<String> triggerStrings = triggerList.map((t) => t.trigger).toList();
      emit(state.copyWith(triggers: [...state.triggers, ...triggerStrings]));
    }
  }

  void editReason() {
    final reason = getIt<SharedPreferences>().getString(
      SharedPrefStrings.reason,
    );
    emit(state.copyWith(reason: reason));
  }

  void setReason() {
    if (state.reason.isEmpty) {
      final reason = getIt<SharedPreferences>().getString(
        SharedPrefStrings.reason,
      );
      emit(state.copyWith(reason: reason));
    }
  }
}
