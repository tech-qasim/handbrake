import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        const InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  void cancelJournalReminderNotification() async {
    await flutterLocalNotificationsPlugin.cancel(
      NotificationsIds.journalReminderId,
    );
  }

  Future<void> scheduleDailyReminders({
    TimeOfDay time = const TimeOfDay(hour: 8, minute: 0),
    String? title,
    String? body,
    String? bigTextContent,
    String? bigTextTitle,
    int notificationId = NotificationsIds.journalReminderId,
    String? channelName,
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate =
        tz.TZDateTime(
          tz.local,
          now.year,
          now.month,
          now.day,
          time.hour,
          time.minute,
        ).isBefore(now)
        ? tz.TZDateTime(
            tz.local,
            now.year,
            now.month,
            now.day + 1,
            time.hour,
            time.minute,
          )
        : tz.TZDateTime(
            tz.local,
            now.year,
            now.month,
            now.day,
            time.hour,
            time.minute,
          );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,

      title ?? "Daily Journal Reminder",
      body ?? "Don't forget to write your journal today!",
      scheduledDate,
      NotificationDetails(
        android: AndroidNotificationDetails(
          styleInformation: bigTextContent != null && bigTextTitle != null
              ? BigTextStyleInformation(
                  bigTextContent,
                  contentTitle: bigTextTitle,
                )
              : null,
          NotificationsChannelStrings.dailyJournalReminderChannel,
          channelName ?? "Journal Reminders",
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  void scheduleRewardNotifications(
    String title,
    int daysFromNow,
    int id,
  ) async {
    final scheduledDate = tz.TZDateTime.now(
      tz.local,
    ).add(Duration(days: daysFromNow));
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      "🎉 You've Achieved a New Milestone!",
      "Award Unlocked: $title",
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          NotificationsChannelStrings.rewardNotiChannel,
          'Award Notifications',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
