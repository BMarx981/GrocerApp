import 'package:grocerapp/data/source/database/database.dart';

class ShoppingListDataWithItems {
  final ShoppingListData list;
  final List<GroceryItemData> items;

  ShoppingListDataWithItems({required this.list, required this.items});
}
