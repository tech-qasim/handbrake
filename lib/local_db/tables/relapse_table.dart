import 'package:drift/drift.dart';

class RelapseTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get relapseTime => dateTime()();
  TextColumn get trigger => text().nullable()();
}
