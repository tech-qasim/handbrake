import 'package:drift/drift.dart';

class Relapses extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get relapseTime => dateTime()();
  TextColumn get trigger => text().nullable()();
  TextColumn get emotion => text().nullable()();
  RealColumn get urgeIntensity => real()();
  IntColumn get day => integer()();
  TextColumn get monthYear => text()();
}
