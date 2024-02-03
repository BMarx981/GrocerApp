import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 100,
          decoration: BoxDecoration(
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
                      const DashboardTitleWidget(title: "Recent Recipes"),
                      Expanded(
                          child: ListView.builder(
                        itemCount: 20,
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
