import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/presentation/common_widgets/add_item_dialog.dart';
import 'package:grocerapp/presentation/common_widgets/add_recipe_dialog.dart';
import 'package:grocerapp/presentation/view/features/dashboard/dashboard_title_widget.dart';

class RecentRecipesGridWidget extends ConsumerStatefulWidget {
  const RecentRecipesGridWidget({
    super.key,
  });

  @override
  ConsumerState<RecentRecipesGridWidget> createState() =>
      _RecentRecipesGridWidgetState();
}

class _RecentRecipesGridWidgetState
    extends ConsumerState<RecentRecipesGridWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      DashboardTitleWidget(
                          title: "Recent Recipes",
                          addFunction: () {
                            showDialog(
                              context: context,
                              builder: (context) => AddRecipeWidget(),
                            );
                          }),
                      Expanded(
                          child: ListView.builder(
                        itemCount: 0,
                        itemBuilder: (BuildContext context, int index) {
                          return const Text("Recent Recipes list item.");
                        },
                      )),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
