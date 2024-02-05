import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/domain/repository/lists_repository.dart';

class DetailsTileWidget extends ConsumerWidget {
  const DetailsTileWidget({
    super.key,
    required this.data,
  });

  final ShoppingListData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<GroceryItemData> details = [];
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) {
        ref.read(listsRepositoryProvider.notifier).deleteList(data.listId!);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.black45.withOpacity(0.2)
            ],
          ),
        ),
        child: ExpansionTile(
          onExpansionChanged: (value) async {
            // details = await ref
            //     .watch(listsRepositoryProvider.notifier)
            //     .fetchGroceryItemsForList(data.listId ?? 0);
          },
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          title: GestureDetector(
            onTap: () {},
            child: Text(
              data.name!,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Grocery Item name")],
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
