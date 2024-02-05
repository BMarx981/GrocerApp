import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/presentation/view/features/app_bar/app_bar.dart';
import 'package:grocerapp/presentation/view/features/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:grocerapp/presentation/view/features/recipes/recipe_list_widget.dart';

class RecipesPage extends ConsumerWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: GrocerAppbar(
        title: "Recipes",
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                RecipeListWidget(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
