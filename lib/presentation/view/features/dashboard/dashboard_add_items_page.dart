import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/domain/repository/grocery_item_repository.dart';
import 'package:grocerapp/domain/repository/lists_repository.dart';
import 'package:grocerapp/presentation/common_widgets/error_message_widget.dart';
import 'package:grocerapp/presentation/view/features/app_bar/app_bar.dart';

class AddItemsPage extends ConsumerWidget {
  const AddItemsPage({super.key, required this.listData});
  final ShoppingListData listData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: GrocerAppbar(title: "Add Items to ${listData.name}"),
        body: Row(
          children: [
            Expanded(
                child: ListOfItemsWidget(
                    listId: listData.listId ?? 0, name: listData.name!)),
            Expanded(
              child: ListOfSelectedItems(listId: listData.listId ?? 0),
            )
          ],
        ));
  }
}

class ListOfSelectedItems extends ConsumerWidget {
  const ListOfSelectedItems({super.key, required this.listId});
  final int listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamOfItems = ref
        .watch(listsRepositoryProvider.notifier)
        .fetchGroceryItemsForList(listId);
    return StreamBuilder(
        stream: streamOfItems,
        builder: (context, snapshot) {
          return Container(
            decoration: BoxDecoration(color: Colors.grey.shade300),
            child: ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Text(snapshot.requireData[index].name!);
                }),
          );
        });
  }
}

class ListOfItemsWidget extends ConsumerWidget {
  const ListOfItemsWidget(
      {super.key, required this.listId, required this.name});
  final String name;
  final int listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(groceryItemRepositoryProvider);
    return provider.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stackTrace) => ErrorMessageWidget(e.toString()),
        data: (data) {
          return Container(
            decoration: BoxDecoration(color: Colors.grey.shade300),
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: Text(data[index].name!),
                      onTap: () {
                        ref
                            .read(listsRepositoryProvider.notifier)
                            .addToShoppingList(listId, name);
                      });
                }),
          );
        });
  }
}
