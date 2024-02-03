import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerapp/presentation/view/features/dashboard/dashboard_page.dart';
import 'package:grocerapp/presentation/view/features/lists/lists_page.dart';
import 'package:grocerapp/presentation/view/features/login/login_page.dart';
import 'package:beamer/beamer.dart';
import 'package:grocerapp/presentation/view/features/recipes/recipes.dart';

class App extends StatelessWidget {
  App({super.key});
  final routerDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: RoutesLocationBuilder(routes: {
      '/': (context, state, data) => const LoginPage(),
      '/dashboard': (context, state, data) => const DashboardPage(),
      '/lists': (context, state, data) => ListsPage(),
      '/recipes': (context, state, data) => const RecipesPage(),
    }).call,
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'GrocerApp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade100),
        ),
        routeInformationParser: BeamerParser(),
        routerDelegate: routerDelegate,
        backButtonDispatcher:
            BeamerBackButtonDispatcher(delegate: routerDelegate),
      ),
    );
  }
}
