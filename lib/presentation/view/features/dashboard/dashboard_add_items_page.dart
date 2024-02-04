import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/domain/repository/grocery_item_repository.dart';
import 'package:grocerapp/presentation/common_widgets/error_message_widget.dart';
import 'package:grocerapp/presentation/view/features/app_bar/app_bar.dart';

class AddItemsPage extends ConsumerWidget {
  const AddItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
        appBar: GrocerAppbar(title: "Add Items for"),
        body: Row(
          children: [Expanded(child: ListOfItemsWidget())],
        ));
  }
}

class ListOfItemsWidget extends ConsumerWidget {
  const ListOfItemsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(groceryItemRepositoryProvider);
    return provider.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stackTrace) => ErrorMessageWidget(e.toString()),
        data: (data) {
          return ListView.builder(itemBuilder: (context, index) {
            return null;
          });
        });
  }
}
