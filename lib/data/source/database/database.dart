import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

@DataClassName('GroceryItemData')
class GroceryItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().customConstraint('UNIQUE').nullable()();
  IntColumn get quantity => integer().nullable()();
  RealColumn get price => real().nullable()();
  TextColumn get location => text().nullable()();
}

@DataClassName('RecipeData')
class Recipes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().customConstraint('UNIQUE').nullable()();
}

@DataClassName('ShoppingListData')
class ShoppingLists extends Table {
  IntColumn get listId =>
      integer().customConstraint('REFERENCES shopping_lists(id)').nullable()();
  TextColumn get name => text()();
  IntColumn get itemId =>
      integer().customConstraint('REFERENCES grocery_items(id)').nullable()();

  @override
  Set<Column> get primaryKey => {listId, itemId};
}

@DataClassName('RecipeGroceryItemData')
class RecipeGroceryItems extends Table {
  IntColumn get recipeId =>
      integer().customConstraint('REFERENCES recipes(id)').nullable()();
  IntColumn get groceryItemId =>
      integer().customConstraint('REFERENCES grocery_items(id)').nullable()();

  @override
  Set<Column> get primaryKey => {recipeId, groceryItemId};
}

@DriftDatabase(
    tables: [GroceryItems, RecipeGroceryItems, Recipes, ShoppingLists])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;
}

final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
