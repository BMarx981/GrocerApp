import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/presentation/view/features/bottom_nav_bar/bottom_nav_bar_widget.dart';

class RecipesPage extends ConsumerWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
      ),
      body: const Row(
        children: [
          Column(
            children: [Text('Recipes')],
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
