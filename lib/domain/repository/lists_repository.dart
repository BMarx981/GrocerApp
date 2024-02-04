import 'package:drift/drift.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lists_repository.g.dart';

@riverpod
class ListsRepository extends _$ListsRepository {
  late final AppDatabase db = ref.read(databaseProvider);

  @override
  Stream<List<ShoppingListData>> build() {
    return db.select(db.shoppingLists).watch();
  }

  Future<List<GroceryItemData>> fetchGroceryItemsForList(int listId) async {
    final query = db.select(db.groceryItems).join([
      innerJoin(db.shoppingLists,
          db.shoppingLists.itemId.equalsExp(db.groceryItems.id))
    ])
      ..where(db.shoppingLists.listId.equals(listId));
    final results = await query.get();

    return results.map((row) {
      final g = row.readTable(db.groceryItems);

      return GroceryItemData(
          id: g.id,
          name: g.name,
          price: g.price,
          quantity: g.quantity,
          location: g.location);
    }).toList();
  }

  Future<int> addList(String name) {
    return db.into(db.shoppingLists).insert(
          ShoppingListsCompanion(
            name: Value(name),
          ),
        );
  }

  Future updateList(int id, {String? name}) {
    final update = (db.update(db.groceryItems)..where((t) => t.id.equals(id)))
        .write(GroceryItemsCompanion(name: Value(name)));
    return update;
  }
}
