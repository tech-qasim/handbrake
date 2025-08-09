import 'package:flutter/material.dart';
import 'package:handbrake/models/settings.dart';

class SettingsState {
  final Settings appSettings;

  SettingsState({required this.appSettings});

  factory SettingsState.initial() {
    return SettingsState(
      appSettings: Settings(
        isJournalReminder: true,
        journalReminderTime: const TimeOfDay(hour: 8, minute: 0),
        isReasonRemidner: true,
        reasonReminder: const TimeOfDay(hour: 8, minute: 0),
      ),
    );
  }

  SettingsState copyWith({Settings? appSettings}) {
    return SettingsState(appSettings: appSettings ?? this.appSettings);
  }
}
