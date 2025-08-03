import 'package:drift/drift.dart';

class Triggers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get trigger => text()();
}
