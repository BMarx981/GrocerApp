import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
        icon: IconButton(
          key: const Key('bottomnav_lists_button'),
          splashColor: null,
          hoverColor: null,
          icon: const Icon(Icons.home),
          onPressed: () {
            Beamer.of(context).beamToReplacementNamed('/dashboard');
          },
        ),
        label: "Dashboard",
      ),
      BottomNavigationBarItem(
        icon: IconButton(
          key: const Key('bottomnav_lists_button'),
          icon: const Icon(Icons.list),
          onPressed: () {
            Beamer.of(context).beamToReplacementNamed('/lists');
          },
        ),
        label: "Lists",
      ),
      BottomNavigationBarItem(
        icon: IconButton(
          key: const Key('bottomnav_recipes_button'),
          icon: const Icon(Icons.book),
          onPressed: () {
            Beamer.of(context).beamToReplacementNamed('/recipes');
          },
        ),
        label: "Recipes",
      ),
    ]);
  }
}
