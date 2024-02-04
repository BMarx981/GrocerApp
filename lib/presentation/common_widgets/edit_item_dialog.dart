import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/data/source/database/database.dart';
import 'package:grocerapp/domain/repository/grocery_item_repository.dart';
import 'package:grocerapp/presentation/common_widgets/textformfield_widget.dart';

class EditItemWidget extends StatelessWidget {
  EditItemWidget({super.key, required this.data});

  final GroceryItemData data;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController storeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = data.name!;
    priceController.text = data.price!.toString();
    quantityController.text = data.quantity!.toString();
    storeController.text = data.location!;
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return AlertDialog(
          elevation: 10,
          shadowColor: Colors.black45,
          title: const Text("Edit Item"),
          actions: [
            ElevatedButton(
                key: const Key('clear_item_button'),
                onPressed: () => _clearFields,
                child: const Text("Clear")),
            ElevatedButton(
                key: const Key('edit_item_button'),
                onPressed: () {
                  ref
                      .read(groceryItemRepositoryProvider.notifier)
                      .updateGroceryItem(data.id,
                          name: nameController.text,
                          price: double.parse(priceController.text),
                          quantity: int.parse(quantityController.text),
                          location: storeController.text);
                  Navigator.pop(context);
                },
                child: const Text("Edit")),
          ],
          content: Form(
            key: const Key('edit_item_form'),
            child: Column(
              children: [
                CustomTextformField(
                  key: const Key('edit_item_name_field'),
                  label: "Item Name",
                  controller: nameController,
                ),
                CustomTextformField(
                  key: const Key('edit_price_name_field'),
                  label: "Item Price",
                  controller: priceController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}$')),
                  ],
                ),
                CustomTextformField(
                  key: const Key('edit_quantity_name_field'),
                  label: "Item Quantity",
                  controller: quantityController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                CustomTextformField(
                  label: "Item Store",
                  key: const Key('edit_store_name_field'),
                  controller: storeController,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _clearFields() {
    nameController.text = "";
    priceController.text = "";
    quantityController.text = "";
    storeController.text = "";
  }
}
