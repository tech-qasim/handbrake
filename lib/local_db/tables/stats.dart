import 'package:drift/drift.dart';

class Stats extends Table {
  IntColumn get totalCleanDays => integer().withDefault(const Constant(0))();
  IntColumn get relapseCount => integer().withDefault(const Constant(0))();
  IntColumn get longestStreak => integer().withDefault(const Constant(0))();
}
