import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/presentation/view/features/bottom_nav_bar/bottom_nav_bar_widget.dart';

class ListsPage extends ConsumerWidget {
  const ListsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lists"),
      ),
      body: const Row(
        children: [
          Column(
            children: [Text('Lists')],
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
