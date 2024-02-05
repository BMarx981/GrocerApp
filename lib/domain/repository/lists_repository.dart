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

  Stream<List<GroceryItemData>> fetchGroceryItemsForList(int listId) {
    final query = (db.select(db.groceryItems).join([
      innerJoin(db.shoppingLists,
          db.shoppingLists.itemId.equalsExp(db.groceryItems.id))
    ])
      ..where(db.shoppingLists.listId.equals(listId)));

    return query.watch().map((rows) {
      return rows.map((row) {
        final r = row.readTable(db.groceryItems);
        return GroceryItemData(
            id: r.id,
            name: r.name,
            price: r.price,
            quantity: r.quantity,
            location: r.location);
      }).toList();
    });
  }

  Future<int> addToShoppingList(int groceryItemId, String? name) async {
    return db.into(db.shoppingLists).insert(ShoppingListsCompanion.insert(
        itemId: Value(groceryItemId), name: Value(name)));
  }

  Future<List<GroceryItemData>> getShoppingListItems() async {
    final query = db.select(db.shoppingLists).join([
      leftOuterJoin(db.groceryItems,
          db.groceryItems.id.equalsExp(db.shoppingLists.itemId)),
    ]);

    final results = await query.get();

    return results.map((row) => row.readTable(db.groceryItems)).toList();
  }

  Future<int> addList(String name) async {
    final result = await db.into(db.shoppingLists).insert(
          ShoppingListsCompanion(
            name: Value(name),
          ),
        );
    print(result);
    return result;
  }

  Future<int> addItemToList(int listId, int itemId, String name) {
    return db
        .into(db.shoppingLists)
        .insert(ShoppingListData(name: name, listId: listId, itemId: itemId));
  }

  Future updateList(int id, {String? name}) {
    final update = (db.update(db.groceryItems)..where((t) => t.id.equals(id)))
        .write(GroceryItemsCompanion(name: Value(name)));
    return update;
  }

  void deleteList(int id) {
    (db.delete(db.shoppingLists)..where((t) => t.listId.equals(id))).go();
  }
}
