import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocerapp/presentation/common_widgets/textformfield_widget.dart';

void main() {
  testWidgets('CustomTextformfield test', (WidgetTester tester) async {
    await tester.pumpWidget(const TestCustomTextformfield());
    final finder = find.byKey(const Key("test_textfield"));
    expect(finder, findsOneWidget);

    await tester.enterText(finder, "Test 123");
    expect(find.text("Test 123"), findsOneWidget);
  });
}

class TestCustomTextformfield extends StatelessWidget {
  const TestCustomTextformfield({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: CustomTextformField(
          key: Key('test_textfield'),
        ),
      ),
    );
  }
}
