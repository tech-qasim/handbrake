import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:handbrake/local_db/app_database.dart';
import 'package:handbrake/local_db/tables/check_ins.dart';
part 'check_in_dao.g.dart';

@DriftAccessor(tables: [CheckIns])
class CheckInDao extends DatabaseAccessor<AppDatabase> with _$CheckInDaoMixin {
  CheckInDao(super.attachedDatabase);

  Future<CheckIn?> insertCheckIn(CheckInsCompanion checkIn) async {
    try {
      final id = await into(checkIns).insert(checkIn);
      return (await (select(
        checkIns,
      )..where((tbl) => tbl.id.equals(id))).getSingle());
    } on SqliteException catch (e) {
      debugPrint('sqlite error : ${e.message}');
      return null;
    } catch (e) {
      debugPrint('unknown error occured : $e');
      return null;
    }
  }

  Future<bool> updateCheckIn(CheckIn checkin) async {
    try {
      await (update(
        checkIns,
      )..where((p) => p.id.equals(checkin.id))).write(checkin);
      return true;
    } on SqliteException catch (e) {
      debugPrint('SQLite Error: ${e.message}');
      return false;
    } catch (e) {
      debugPrint('update database error : $e');
      return false;
    }
  }

  Future<CheckIn?> getCheckInByDayAndMonthYear(
    int day,
    String monthYear,
  ) async {
    try {
      final query = select(checkIns)
        ..where((tbl) => tbl.day.equals(day) & tbl.monthYear.equals(monthYear));

      return await query.getSingleOrNull();
    } on SqliteException catch (e) {
      debugPrint('sqlite error : ${e.message}');
      return null;
    } catch (e) {
      debugPrint("Error while fetching checkin: $e");
      return null;
    }
  }

  Future<List<CheckIn>> getCheckInByMonthYear(String monthYear) async {
    try {
      return (select(
        checkIns,
      )..where((t) => t.monthYear.equals(monthYear))).get();
    } on SqliteException catch (e) {
      debugPrint('sqlite error : ${e.message}');
      return [];
    } catch (e) {
      debugPrint("Error while fetching checkin: $e");
      return [];
    }
  }
}
