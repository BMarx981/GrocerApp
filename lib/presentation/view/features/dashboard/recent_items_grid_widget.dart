import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/presentation/view/features/dashboard/dashboard_title_widget.dart';

class RecentItemsGridWidget extends ConsumerStatefulWidget {
  const RecentItemsGridWidget({
    super.key,
  });

  @override
  ConsumerState<RecentItemsGridWidget> createState() =>
      _RecentItemsGridWidgetState();
}

class _RecentItemsGridWidgetState extends ConsumerState<RecentItemsGridWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
                      const DashboardTitleWidget(title: "Recent Items"),
                      Expanded(
                          child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return const Text("Recent Items list item.");
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
