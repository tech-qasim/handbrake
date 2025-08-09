import 'dart:convert';

import 'package:flutter/material.dart';

class Settings {
  bool isJournalReminder;
  TimeOfDay journalReminderTime;
  bool isReasonRemidner;
  TimeOfDay reasonReminder;

  Settings({
    required this.isJournalReminder,
    required this.journalReminderTime,
    required this.isReasonRemidner,
    required this.reasonReminder,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'isJournalReminder': isJournalReminder});
    result.addAll({'isReasonRemidner': isReasonRemidner});
    result.addAll({
      'journalReminderTime': {
        'hour': journalReminderTime.hour,
        'minute': journalReminderTime.minute,
      },
    });

    return result;
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    final timeMap = map['journalReminderTime'] as Map<String, dynamic>?;
    final reasonReminderTimeMap =
        map['reasonReminder'] as Map<String, dynamic>?;
    return Settings(
      isReasonRemidner: map['isReasonRemidner'] ?? true,
      isJournalReminder: map['isJournalReminder'] ?? true,
      journalReminderTime: timeMap != null
          ? TimeOfDay(
              hour: timeMap['hour'] ?? 0,
              minute: timeMap['minute'] ?? 0,
            )
          : const TimeOfDay(hour: 8, minute: 0),

      reasonReminder: reasonReminderTimeMap != null
          ? TimeOfDay(
              hour: reasonReminderTimeMap['hour'] ?? 0,
              minute: reasonReminderTimeMap['minute'] ?? 0,
            )
          : const TimeOfDay(hour: 8, minute: 0),
    );
  }

  String toJson() => json.encode(toMap());

  factory Settings.fromJson(String source) =>
      Settings.fromMap(json.decode(source));

  Settings copyWith({
    bool? isJournalReminder,
    TimeOfDay? journalReminderTime,
    bool? isReasonRemidner,
    TimeOfDay? reasonReminder,
  }) {
    return Settings(
      isJournalReminder: isJournalReminder ?? this.isJournalReminder,
      journalReminderTime: journalReminderTime ?? this.journalReminderTime,
      isReasonRemidner: isReasonRemidner ?? this.isReasonRemidner,
      reasonReminder: reasonReminder ?? this.reasonReminder,
    );
  }

  @override
  String toString() =>
      'Settings(isJournalReminder: $isJournalReminder, journalReminderTime: $journalReminderTime)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Settings &&
        other.isJournalReminder == isJournalReminder &&
        other.journalReminderTime == journalReminderTime;
  }

  @override
  int get hashCode => isJournalReminder.hashCode ^ journalReminderTime.hashCode;
}
