import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/presentation/view/features/bottom_nav_bar/bottom_nav_bar_widget.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('dashboard_appbar'),
        title: const Text("Dashboard"),
      ),
      body: const Row(
        children: [
          Column(
            children: [Text('Dashboard')],
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
