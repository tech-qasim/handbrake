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
    }
  }
}
