import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:handbrake/local_db/app_database.dart';
import 'package:handbrake/local_db/tables/journals.dart';
part 'journal_dao.g.dart';

@DriftAccessor(tables: [Journals])
class JournalDao extends DatabaseAccessor<AppDatabase> with _$JournalDaoMixin {
  JournalDao(super.db);

  Future<Journal?> insertJournalEntry(JournalsCompanion journalEntry) async {
    try {
      final id = await into(journals).insert(journalEntry);
      return (await (select(
        journals,
      )..where((tbl) => tbl.id.equals(id))).getSingle());
    } on SqliteException catch (e) {
      debugPrint('sqlite error : ${e.message}');
      return null;
    } catch (e) {
      debugPrint('unknown error occured : $e');
      return null;
    }
  }

  //   Future<List<Relapse>> getAllRelapses() async {
  //     try {
  //       final products = await select(relapses).get();
  //       return products;
  //     } on SqliteException catch (e) {
  //       print('SQLite Error: ${e.message}');
  //       return [];
  //     } catch (e) {
  //       print('Unknown error while fetching products: $e');
  //       return [];
  //     }
  //   }

  //   Future<Relapse?> getRelapseById(int id) async {
  //     try {
  //       final relapse = await (select(
  //         relapses,
  //       )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  //       return relapse; // Could be null if not found, or a product
  //     } on SqliteException catch (e) {
  //       print('SQLite Error while fetching product by ID: ${e.message}');
  //       return null;
  //     } catch (e) {
  //       print('Unexpected error: $e');
  //       return null;
  //     }
  //   }

  //   Future<Relapse?> getLastRelapse() async {
  //     try {
  //       final relapse =
  //           await (select(relapses)
  //                 ..orderBy([(tbl) => OrderingTerm.desc(tbl.id)])
  //                 ..limit(1))
  //               .getSingleOrNull();
  //       return relapse;
  //     } on SqliteException catch (e) {
  //       debugPrint('SQLite Error while fetching last relapse: ${e.message}');
  //       return null;
  //     } catch (e) {
  //       debugPrint('Unexpected error: $e');
  //       return null;
  //     }
  //   }

  //   Future<List<Relapse>> getRelapsesByMonth(String monthYear) {
  //     return (select(
  //       relapses,
  //     )..where((t) => t.monthYear.equals(monthYear))).get();
  //   }

  // Future<bool> updateProduct(Product product) =>
  //     update(productTable).replace(product.toCompanion());

  // Future<bool> updateProduct( product) async {
  //   try {
  //     await (update(
  //       db.productTable,
  //     )..where((p) => p.id.equals(product.id))).write(product.toCompanion());
  //     return true;
  //   } on SqliteException catch (e) {
  //     debugPrint('SQLite Error: ${e.message}');
  //     return false;
  //   } catch (e) {
  //     debugPrint('update database error : $e');
  //     return false;
  //   }
  // }

  // Future<bool> deleteProduct(String id) async {
  //   try {
  //     await (delete(productTable)..where((tbl) => tbl.id.equals(id))).go();
  //     return true;
  //   } on SqliteException catch (e) {
  //     debugPrint('SQLite Error: ${e.message}');
  //     return false;
  //   } catch (e) {
  //     debugPrint('delete database error: $e');
  //     return false;
  //   }
  // }
}
