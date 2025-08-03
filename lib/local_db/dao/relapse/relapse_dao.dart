import 'package:drift/drift.dart' hide Trigger;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:handbrake/local_db/app_database.dart';
import 'package:handbrake/local_db/tables/relapses.dart';
import 'package:handbrake/local_db/tables/stats.dart';
import 'package:handbrake/local_db/tables/triggers.dart';
part 'relapse_dao.g.dart';

@DriftAccessor(tables: [Relapses, Stats, Triggers])
class RelapseDao extends DatabaseAccessor<AppDatabase> with _$RelapseDaoMixin {
  RelapseDao(super.db);

  Future<Relapse?> insertRelapse(RelapsesCompanion relapse) async {
    try {
      final id = await into(relapses).insert(relapse);
      return (await (select(
        relapses,
      )..where((tbl) => tbl.id.equals(id))).getSingle());
    } on SqliteException catch (e) {
      debugPrint('sqlite error : ${e.message}');
      return null;
    } catch (e) {
      debugPrint('unknown error occured : $e');
      return null;
    }
  }

  Future<List<Relapse>> getAllRelapses() async {
    try {
      final products = await select(relapses).get();
      return products;
    } on SqliteException catch (e) {
      print('SQLite Error: ${e.message}');
      return [];
    } catch (e) {
      print('Unknown error while fetching products: $e');
      return [];
    }
  }

  Future<Relapse?> getRelapseById(int id) async {
    try {
      final relapse = await (select(
        relapses,
      )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
      return relapse; // Could be null if not found, or a product
    } on SqliteException catch (e) {
      print('SQLite Error while fetching product by ID: ${e.message}');
      return null;
    } catch (e) {
      print('Unexpected error: $e');
      return null;
    }
  }

  Future<Relapse?> getLastRelapse() async {
    try {
      final relapse =
          await (select(relapses)
                ..orderBy([(tbl) => OrderingTerm.desc(tbl.id)])
                ..limit(1))
              .getSingleOrNull();
      return relapse;
    } on SqliteException catch (e) {
      debugPrint('SQLite Error while fetching last relapse: ${e.message}');
      return null;
    } catch (e) {
      debugPrint('Unexpected error: $e');
      return null;
    }
  }

  Future<Relapse?> getFirstRelapse() async {
    try {
      final relapse =
          await (select(relapses)
                ..orderBy([(tbl) => OrderingTerm.asc(tbl.id)])
                ..limit(1))
              .getSingleOrNull();
      return relapse;
    } on SqliteException catch (e) {
      debugPrint('SQLite Error while fetching last relapse: ${e.message}');
      return null;
    } catch (e) {
      debugPrint('Unexpected error: $e');
      return null;
    }
  }

  Future<List<Relapse>> getRelapsesByMonth(String monthYear) {
    return (select(
      relapses,
    )..where((t) => t.monthYear.equals(monthYear))).get();
  }

  Future<Stat?> getStats() async {
    return select(stats).getSingleOrNull();
  }

  Future<Trigger?> addNewTrigger(TriggersCompanion trigger) async {
    try {
      final id = await into(triggers).insert(trigger);
      return (await (select(
        triggers,
      )..where((tbl) => tbl.id.equals(id))).getSingle());
    } on SqliteException catch (e) {
      debugPrint('sqlite error : ${e.message}');
      return null;
    } catch (e) {
      debugPrint('unknown error occured : $e');
      return null;
    }
  }

  Future<List<Trigger>> getTriggers() async {
    try {
      final triggerList = await select(triggers).get();
      return triggerList;
    } on SqliteException catch (e) {
      debugPrint('SQLite Error: ${e.message}');
      return [];
    } catch (e) {
      debugPrint('Unknown error while fetching products: $e');
      return [];
    }
  }
}
