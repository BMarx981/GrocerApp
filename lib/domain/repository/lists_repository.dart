import 'package:drift/drift.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lists_repository.g.dart';

@riverpod
class ListsRepositoryProvider extends _$ListsRepositoryProvider {
  late final AppDatabase db = ref.read(databaseProvider);

  @override
  Future<List<GroceryItemData>> build() {
    return db.select(db.groceryItems).get();
  }

  Future<int> addItem(
      {String? name, int quantity = 0, double? price, String? location}) {
    return db.into(db.groceryItems).insert(
          GroceryItemsCompanion(
            name: Value(name),
            quantity: Value(quantity),
            price: Value(price),
            location: Value(location),
          ),
        );
  }

  Future updateItem(int id,
      {String? name, int quantity = 0, double? price, String? location}) {
    final update = (db.update(db.groceryItems)..where((t) => t.id.equals(id)))
        .write(GroceryItemsCompanion(
      name: Value(name),
      quantity: Value(quantity),
      price: Value(price),
      location: Value(location),
    ));
    return update;
  }
}
