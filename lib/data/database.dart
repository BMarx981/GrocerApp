import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DataClassName('GroceryItem')
class GroceryItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().customConstraint('UNIQUE').nullable()();
  IntColumn get quantity => integer()();
  RealColumn get price => real().nullable()();
  TextColumn get location => text().nullable()();
}

@DataClassName('Recipe')
class Recipes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().customConstraint('UNIQUE').nullable()();
}

@DataClassName('RecipeGroceryItem')
class RecipeGroceryItems extends Table {
  IntColumn get recipeId =>
      integer().customConstraint('REFERENCES recipes(id)').nullable()();
  IntColumn get groceryItemId =>
      integer().customConstraint('REFERENCES grocery_items(id)').nullable()();

  @override
  Set<Column> get primaryKey => {recipeId, groceryItemId};
}

@DriftDatabase(tables: [GroceryItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 2;

  LazyDatabase _openConnection() {
    final logger = Logger();
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      logger.t("Database connection opening");

      return NativeDatabase.createInBackground(file);
    });
  }
}
