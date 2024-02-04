import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/application/lists_providers/lists_providers.dart';
import 'package:grocerapp/domain/repository/lists_repository.dart';
import 'package:grocerapp/presentation/common_widgets/textformfield_widget.dart';
import 'package:grocerapp/presentation/view/features/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:grocerapp/presentation/common_widgets/add_item_dialog.dart';
import 'package:grocerapp/presentation/view/features/lists/shopping_list_widget.dart';

class ListsPage extends ConsumerWidget {
  ListsPage({super.key});
  final newListController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listsProviderData = ref.watch(listsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Lists"),
        shadowColor: Colors.black,
        elevation: 8,
        scrolledUnderElevation: null,
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AddItemWidget(),
                              );
                            },
                            child: const Text("Add item"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(listsProvider.notifier)
                                    .toggleTextField();
                              },
                              child: const Text("Add shopping list.")),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: listsProviderData,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8, 4, 8),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.black45)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                              child: CustomTextformField(
                                label: "Shopping list name",
                                controller: newListController,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                            onPressed: () {
                              ref
                                  .read(listsRepositoryProvider.notifier)
                                  .addList(newListController.text);
                              ref
                                  .read(listsProvider.notifier)
                                  .toggleTextField();
                              newListController.clear();
                            },
                            icon: const Icon(Icons.add)),
                      ),
                    ],
                  ),
                ),
                const ShoppinglistWidget()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
