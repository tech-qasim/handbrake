import 'package:handbrake/local_db/app_database.dart';

class JournalState {
  List<Journal> journalEntries;
  Map<String, List<Journal>> groupedEntries;
  JournalState({required this.journalEntries, required this.groupedEntries});

  JournalState copyWith({
    List<Journal>? journalEntries,
    Map<String, List<Journal>>? groupedEntries,
  }) {
    return JournalState(
      journalEntries: journalEntries ?? this.journalEntries,
      groupedEntries: groupedEntries ?? this.groupedEntries,
    );
  }

  factory JournalState.initial() {
    return JournalState(journalEntries: [], groupedEntries: {});
  }
}
