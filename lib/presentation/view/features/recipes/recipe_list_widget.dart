import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/domain/repository/recipe_repository.dart';
import 'package:grocerapp/presentation/common_widgets/error_message_widget.dart';
import 'package:grocerapp/presentation/view/features/recipes/recipe_details_widget.dart';

class RecipeListWidget extends ConsumerWidget {
  const RecipeListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeRepoProvider = ref.watch(recipeRepositoryProvider);
    return recipeRepoProvider.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, stackTrace) => ErrorMessageWidget(e.toString()),
      data: (data) {
        return Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(child: RecipeDetailsWidget(name: data[index].name!)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                  )
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ));
      },
    );
  }
}
