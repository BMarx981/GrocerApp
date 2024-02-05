import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocerapp/presentation/view/features/app_bar/app_bar.dart';

void main() {
  testWidgets('GrocerAppbar test', (WidgetTester tester) async {
    await tester.pumpWidget(const TestGrocerAppbar());
    final finder = find.byType(AppBar);
    expect(finder, findsOneWidget);

    expect(find.text("Test Title"), findsOneWidget);
    expect(find.text("123 Test"), findsNothing);
  });
}

class TestGrocerAppbar extends StatelessWidget {
  const TestGrocerAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        appBar: GrocerAppbar(
          title: "Test Title",
        ),
        body: Column(
          children: [Expanded(child: Placeholder())],
        ),
      ),
    );
  }
}



// GrocerAppbar({required Key key})