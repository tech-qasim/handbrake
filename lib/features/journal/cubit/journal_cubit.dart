import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/features/journal/cubit/journal_state.dart';
import 'package:handbrake/local_db/app_database.dart';
import 'package:handbrake/utils/di.dart';

class JournalCubit extends Cubit<JournalState> {
  JournalCubit() : super(JournalState.initial());

  void addJournalEntry(String title, String content) async {
    final journalsCompanion = JournalsCompanion(
      title: Value(title),
      content: Value(content),
    );
    final result = await getIt<AppDatabase>().journalDao.insertJournalEntry(
      journalsCompanion,
    );

    if (result != null) {
      emit(state.copyWith(journalEntries: [...state.journalEntries, result]));
      groupEntriesByDate();
    }
  }

  Future<bool> updateJournalEntry(Journal entry) async {
    final result = await getIt<AppDatabase>().journalDao.updateJouralEntry(
      entry,
    );

    if (result) {
      final updatedEntries = state.journalEntries.map((e) {
        if (e.id == entry.id) {
          return entry;
        }
        return e; // return the existing item if not matched
      }).toList();

      emit(state.copyWith(journalEntries: updatedEntries));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteJournalEntry(int id) async {
    final result = await getIt<AppDatabase>().journalDao.deleteJournalEntry(id);

    if (result) {
      final updatedEntries = List<Journal>.from(state.journalEntries)
        ..removeWhere((entry) => entry.id == id);

      emit(state.copyWith(journalEntries: updatedEntries));
      return true;
    } else {
      return false;
    }
  }

  void groupEntriesByDate() {
    final Map<String, List<Journal>> groupedEntries = {};

    for (final entry in state.journalEntries) {
      final date = entry.createdAt;
      final dateKey = "${date.year}-${date.month}-${date.day}";

      if (!groupedEntries.containsKey(dateKey)) {
        groupedEntries[dateKey] = [];
      }
      groupedEntries[dateKey]!.add(entry);
    }
    // Sort each group by descending createdTime
    groupedEntries.forEach((key, notes) {
      notes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    });

    emit(state.copyWith(groupedEntries: groupedEntries));
  }

  void getJournalEntries() async {
    final result = await getIt<AppDatabase>().journalDao.getAllEntries();
    emit(state.copyWith(journalEntries: result));
    groupEntriesByDate();
  }
}
