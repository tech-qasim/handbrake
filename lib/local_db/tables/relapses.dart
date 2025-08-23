import 'package:drift/drift.dart';

class Relapses extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get relapseTime => dateTime()();
  TextColumn get relapseHappeningTime =>
      text().withDefault(const Constant(''))();
  TextColumn get trigger => text().withDefault(const Constant(''))();
  RealColumn get urgeIntensity => real().nullable()();
  TextColumn get isResistUrge => text().withDefault(const Constant(''))();
  TextColumn get urgeStartedReason => text().withDefault(const Constant(''))();
  IntColumn get day => integer()();
  TextColumn get monthYear => text()();
}
