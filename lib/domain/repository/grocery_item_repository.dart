import 'package:drift/drift.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_item_repository.g.dart';

@riverpod
class GroceryItemRepository extends _$GroceryItemRepository {
  late final AppDatabase db = ref.read(databaseProvider);

  @override
  Stream<List<GroceryItemData>> build() {
    return db.select(db.groceryItems).watch();
  }

  Future<List<GroceryItemData>> fetchGroceryItems() async {
    return await db.select(db.groceryItems).get();
  }

  Future<int> addItem(
      {String? name, int quantity = 0, double? price, String? location}) {
    return db.into(db.groceryItems).insert(GroceryItemsCompanion(
        name: Value(name),
        quantity: Value(quantity),
        price: Value(price),
        location: Value(location)));
  }

  Future updateGroceryItem(int id,
      {String? name, int quantity = 0, double? price, String? location}) {
    final update = (db.update(db.groceryItems)..where((t) => t.id.equals(id)))
        .write(GroceryItemsCompanion(
            name: Value(name),
            quantity: Value(quantity),
            price: Value(price),
            location: Value(location)));
    return update;
  }

  void deleteItem(int id) {
    (db.delete(db.groceryItems)..where((t) => t.id.equals(id))).go();
  }
}
