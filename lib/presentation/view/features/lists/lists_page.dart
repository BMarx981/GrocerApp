import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/application/lists_providers/lists_providers.dart';
import 'package:grocerapp/domain/repository/lists_repository.dart';
import 'package:grocerapp/presentation/common_widgets/textformfield_widget.dart';
import 'package:grocerapp/presentation/view/features/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:grocerapp/presentation/view/features/lists/add_item_dialog.dart';

class ListsPage extends ConsumerWidget {
  ListsPage({super.key});
  final newListController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listsProviderData = ref.watch(listsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Lists"),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
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
                            child: const Text("Add item")),
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
                Visibility(
                  visible: listsProviderData,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.black45)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextformField(
                                label: "Shopping list name",
                                controller: newListController,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            ref
                                .read(listsRepositoryProvider.notifier)
                                .addList(newListController.text);
                            ref.read(listsProvider.notifier).toggleTextField();
                            newListController.clear();
                          },
                          child: const Icon(Icons.add)),
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

class ShoppinglistWidget extends ConsumerWidget {
  const ShoppinglistWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listsRepoProvider = ref.watch(listsRepositoryProvider);
    return listsRepoProvider.when(
      data: (data) {
        return Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                child: Text(data[index].name),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => ErrorMessageWidget(e.toString()),
    );
  }
}

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(this.errorMessage, {super.key});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style:
          Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.red),
    );
  }
}
