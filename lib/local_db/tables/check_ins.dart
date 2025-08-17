import 'package:drift/drift.dart';

class CheckIns extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get day => integer()();
  TextColumn get monthYear => text()();
  BoolColumn get isClean => boolean().withDefault(const Constant(true))();
}
