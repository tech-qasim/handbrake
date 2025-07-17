import 'package:handbrake/local_db/app_database.dart';

class JournalState {
  List<Journal> journalEntries;
  JournalState({required this.journalEntries});

  JournalState copyWith({List<Journal>? journalEntries}) {
    return JournalState(journalEntries: journalEntries ?? this.journalEntries);
  }

  factory JournalState.initial() {
    return JournalState(journalEntries: []);
  }
}
