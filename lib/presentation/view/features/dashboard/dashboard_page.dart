import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/presentation/view/features/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:grocerapp/presentation/view/features/dashboard/recent_items_grid_widget.dart';
import 'package:grocerapp/presentation/view/features/dashboard/recent_lists_widget.dart';
import 'package:grocerapp/presentation/view/features/dashboard/recent_recipes_grid_widget.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int gridCount = 2;
    return Scaffold(
      appBar: AppBar(
        key: const Key('dashboard_appbar'),
        title: const Text("Dashboard"),
      ),
      body: Row(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 800) {
                  gridCount = 1;
                } else {
                  gridCount = 2;
                }
                return GridView.count(
                    crossAxisCount: gridCount,
                    children: const [
                      RecentItemsGridWidget(),
                      RecentRecipesGridWidget(),
                      RecentListsGridWidget(),
                    ]);
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
