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
