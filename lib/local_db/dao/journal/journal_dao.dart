import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:handbrake/local_db/app_database.dart';
import 'package:handbrake/local_db/tables/journals.dart';
part 'journal_dao.g.dart';

@DriftAccessor(tables: [Journals])
class JournalDao extends DatabaseAccessor<AppDatabase> with _$JournalDaoMixin {
  JournalDao(super.db);

  Future<Journal?> insertJournalEntry(JournalsCompanion journalEntry) async {
    try {
      final id = await into(journals).insert(journalEntry);
      return (await (select(
        journals,
      )..where((tbl) => tbl.id.equals(id))).getSingle());
    } on SqliteException catch (e) {
      debugPrint('sqlite error : ${e.message}');
      return null;
    } catch (e) {
      debugPrint('unknown error occured : $e');
      return null;
    }
  }

  Future<List<Journal>> getAllEntries() async {
    try {
      final journalEntries = await select(journals).get();
      return journalEntries;
    } on SqliteException catch (e) {
      print('SQLite Error: ${e.message}');
      return [];
    } catch (e) {
      print('Unknown error while fetching products: $e');
      return [];
    }
  }

  Future<bool> updateJouralEntry(Journal entry) async {
    try {
      await (update(
        db.journals,
      )..where((p) => p.id.equals(entry.id))).write(entry);
      return true;
    } on SqliteException catch (e) {
      debugPrint('SQLite Error: ${e.message}');
      return false;
    } catch (e) {
      debugPrint('update database error : $e');
      return false;
    }
  }

  Future<bool> deleteJournalEntry(int id) async {
    try {
      await (delete(journals)..where((tbl) => tbl.id.equals(id))).go();
      return true;
    } on SqliteException catch (e) {
      debugPrint('SQLite Error: ${e.message}');
      return false;
    } catch (e) {
      debugPrint('delete database error: $e');
      return false;
    }
  }
}
