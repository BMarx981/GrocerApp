import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/domain/repository/recipe_repository.dart';
import 'package:grocerapp/presentation/common_widgets/textformfield_widget.dart';

class AddRecipeWidget extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  AddRecipeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return AlertDialog(
          elevation: 10,
          shadowColor: Colors.black45,
          title: const Text("Add Recipe"),
          actions: [
            ElevatedButton(
                key: const Key('clear_item_button'),
                onPressed: () => _clearFields,
                child: const Text("Clear")),
            ElevatedButton(
                key: const Key('add_item_button'),
                onPressed: () {
                  ref
                      .read(recipeRepositoryProvider.notifier)
                      .addRecipe(name: nameController.text);

                  Navigator.pop(context);
                },
                child: const Text("Submit")),
          ],
          content: Form(
            key: const Key('add_recipe_form'),
            child: Column(
              children: [
                CustomTextformField(
                  key: const Key('add_recipe_name_field'),
                  label: "Recipe Name",
                  controller: nameController,
                ),
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
