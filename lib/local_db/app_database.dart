import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:handbrake/local_db/dao/check_in/check_in_dao.dart';
import 'package:handbrake/local_db/dao/journal/journal_dao.dart';
import 'package:handbrake/local_db/dao/relapse/relapse_dao.dart';
import 'package:handbrake/local_db/tables/actions.dart';
import 'package:handbrake/local_db/tables/check_ins.dart';
import 'package:handbrake/local_db/tables/journals.dart';
import 'package:handbrake/local_db/tables/relapses.dart';
import 'package:handbrake/local_db/tables/stats.dart';
import 'package:handbrake/local_db/tables/triggers.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Relapses, Journals, Stats, Triggers, CheckIns, Actions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  RelapseDao get relapseDao => RelapseDao(this);
  JournalDao get journalDao => JournalDao(this);
  CheckInDao get checkInDao => CheckInDao(this);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'noti.sqlite'));
    return NativeDatabase(file);
  });
}
