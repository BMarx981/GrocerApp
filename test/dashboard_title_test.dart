import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocerapp/presentation/view/features/dashboard/dashboard_title_widget.dart';

void main() {
  testWidgets('Dashboard title test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TestDashboardTitleWidget());

    // Verify that our counter starts at 0.
    expect(find.text("Test title"), findsOneWidget);
    expect(find.text('Not a test'), findsNothing);
  });
}

class TestDashboardTitleWidget extends StatelessWidget {
  const TestDashboardTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: DashboardTitleWidget(
          title: "Test title",
        ),
      ),
    );
  }
}
