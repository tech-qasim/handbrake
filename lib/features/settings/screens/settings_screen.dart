import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/home/cubit/home_cubit.dart';
import 'package:handbrake/features/settings/cubit/settings_cubit.dart';
import 'package:handbrake/services/notification_service.dart';
import 'package:handbrake/theme/app_colors.dart';
import 'package:handbrake/utils/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SettingsCubit>().loadSettings();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsCubit>().state.appSettings;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: context.textTheme.displayLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notifications',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.awardSubtitleColor,
                        ),
                      ),
                      10.height,
                      ReminderSwitchTile(
                        value: settings.isJournalReminder,
                        title: 'Journal Reminder',
                        time: settings.journalReminderTime,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: settings.journalReminderTime,
                          ).then((pickedTime) {
                            if (pickedTime != null) {
                              if (context.mounted) {
                                context.read<SettingsCubit>().saveSettings(
                                  settings.copyWith(
                                    journalReminderTime: pickedTime,
                                  ),
                                );

                                if (settings.isJournalReminder) {
                                  getIt<NotificationService>()
                                      .scheduleDailyReminders(time: pickedTime);
                                }
                              }
                            }
                          });
                        },
                        onChange: (bool value) {
                          final updateSettings = settings.copyWith(
                            isJournalReminder: value,
                          );
                          context.read<SettingsCubit>().saveSettings(
                            updateSettings,
                          );

                          if (value) {
                            getIt<NotificationService>().scheduleDailyReminders(
                              time: settings.journalReminderTime,
                            );
                          } else {
                            getIt<NotificationService>()
                                .cancelJournalReminderNotification();
                          }
                        },
                      ),
                      2.height,
                      ReminderSwitchTile(
                        value: settings.isReasonRemidner,
                        title: 'Reason Reminder',
                        time: settings.reasonReminder,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: settings.reasonReminder,
                          ).then((pickedTime) {
                            if (pickedTime != null) {
                              if (context.mounted) {
                                context.read<SettingsCubit>().saveSettings(
                                  settings.copyWith(reasonReminder: pickedTime),
                                );
                                final reason = context
                                    .read<HomeCubit>()
                                    .state
                                    .reason;
                                if (settings.isReasonRemidner) {
                                  getIt<NotificationService>().scheduleDailyReminders(
                                    time: pickedTime,
                                    title:
                                        "✨ Reason Reminder so you don't forget why you started this journey.",
                                    body: reason,
                                    bigTextTitle:
                                        "✨ Reason Reminder so you don't forget why you started this journey.",
                                    bigTextContent: reason,
                                    notificationId:
                                        NotificationsIds.reasonReminderId,
                                  );
                                }
                              }
                            }
                          });
                        },
                        onChange: (bool value) {
                          final updateSettings = settings.copyWith(
                            isReasonRemidner: value,
                          );
                          context.read<SettingsCubit>().saveSettings(
                            updateSettings,
                          );

                          if (value) {
                            final reason = context
                                .read<HomeCubit>()
                                .state
                                .reason;
                            getIt<NotificationService>().scheduleDailyReminders(
                              time: settings.journalReminderTime,
                              bigTextContent: reason,
                              bigTextTitle:
                                  "✨ Reason Reminder so you don't forget why you started this journey.",
                              title:
                                  "✨ Reason Reminder so you don't forget why you started this journey.",
                              body: reason,
                              notificationId: NotificationsIds.reasonReminderId,
                            );
                          } else {
                            getIt<NotificationService>().cancelNotifications(
                              NotificationsIds.reasonReminderId,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReminderSwitchTile extends StatelessWidget {
  const ReminderSwitchTile({
    super.key,
    required this.title,
    this.time,
    this.onChange,
    this.onTap,
    required this.value,
  });

  final String title;
  final TimeOfDay? time;
  final VoidCallback? onTap;
  final Function(bool)? onChange;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: context.textTheme.bodyLarge),
          const Spacer(),
          Text(
            time?.to12HourString() ?? '',
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.awardSubtitleColor,
            ),
          ),
          7.width,
          Switch(value: value, onChanged: onChange),
        ],
      ),
    );
  }
}
