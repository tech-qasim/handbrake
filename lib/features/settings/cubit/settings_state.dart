class SettingsState {
  final bool isJournalReminder;

  SettingsState({required this.isJournalReminder});

  SettingsState copyWith({bool? isJournalReminder}) {
    return SettingsState(
      isJournalReminder: isJournalReminder ?? this.isJournalReminder,
    );
  }

  factory SettingsState.initial() {
    return SettingsState(isJournalReminder: true);
  }
}
