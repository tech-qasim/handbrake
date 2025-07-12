import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:handbrake/local_db/app_database.dart';
import 'package:handbrake/local_db/tables/relapse_table.dart';
part 'relapse_dao.g.dart';

@DriftAccessor(tables: [RelapseTable])
class RelapseDao extends DatabaseAccessor<AppDatabase> with _$RelapseDaoMixin {
  RelapseDao(super.db);

  Future<bool> insertRelapse(RelapseTableCompanion product) async {
    try {
      into(relapseTable).insert(product);
      return true;
    } on SqliteException catch (e) {
      debugPrint('sqlite error : ${e.message}');
      return false;
    } catch (e) {
      debugPrint('unknown error occured : $e');
      return false;
    }
  }

  Future<List<RelapseTableData>> getAllRelapses() async {
    try {
      final products = await select(relapseTable).get();
      return products;
    } on SqliteException catch (e) {
      print('SQLite Error: ${e.message}');
      return [];
    } catch (e) {
      print('Unknown error while fetching products: $e');
      return [];
    }
  }

  Future<RelapseTableData?> getRelapseById(int id) async {
    try {
      final relapse = await (select(
        relapseTable,
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
