import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeDetailsWidget extends ConsumerWidget {
  const RecipeDetailsWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 17, 68, 109),
              ),
              child: Text(name, style: const TextStyle(color: Colors.white))),
        ),
      ],
    );
  }
}
