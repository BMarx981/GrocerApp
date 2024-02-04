import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/domain/repository/lists_repository.dart';
import 'package:grocerapp/presentation/common_widgets/textformfield_widget.dart';

class AddListWidget extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  AddListWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return AlertDialog(
          elevation: 10,
          shadowColor: Colors.black45,
          title: const Text("Add List"),
          actions: [
            ElevatedButton(
                key: const Key('clear_list_button'),
                onPressed: () => _clearFields,
                child: const Text("Clear")),
            ElevatedButton(
                key: const Key('add_list_button'),
                onPressed: () {
                  ref
                      .read(listsRepositoryProvider.notifier)
                      .addList(nameController.text);
                  Navigator.pop(context);
                },
                child: const Text("Submit")),
          ],
          content: Form(
            key: const Key('add_list_form'),
            child: Column(
              children: [
                CustomTextformField(
                  key: const Key('add_list_name_field'),
                  label: "List Name",
                  controller: nameController,
                ),
                // ListView.builder(
                //     itemBuilder: (context, index) {
                //       return GestureDetector(
                //           onTap: () {
                //             ref
                //                 .read(listsRepositoryProvider.notifier)
                //                 .addItemToList(
                //                     listId, itemsList[index].id, name);
                //           },
                //           child: Text(itemsList[index].name ?? ""));
                //     },
                //     itemCount: itemsList.length),
              ],
            ),
          ),
        );
      },
    );
  }

  void _clearFields() {
    nameController.clear();
  }
}
