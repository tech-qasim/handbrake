import 'package:drift/drift.dart';

class Actions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get action => text()();
}
