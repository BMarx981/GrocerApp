import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocerapp/app.dart';
import 'package:grocerapp/presentation/view/features/login/login_page.dart';
import 'package:grocerapp/presentation/view/features/login/login_section.dart';

void main() {
  group('Login Screen Unit Test', () {
    test('Username validation', () {
      final result = LoginSection().validateUsername('username123');

      // Act & Assert
      expect(result, null);
    });

    test('Empty username validation', () {
      // Arrange
      final result = LoginSection().validateUsername('');

      // Act & Assert
      expect(result, 'Please enter a valid user name');
    });

    test('Password validation', () {
      // Arrange
      final result = LoginSection().validatePassword('password123');

      // Act & Assert
      expect(result, null); // Assuming null means validation passed
    });

    test('Empty password validation', () {
      // Arrange
      final result = LoginSection().validatePassword('');

      // Act & Assert
      expect(result, 'Please enter a valid password');
    });
  });

  group('Login Screen Widget Test', () {
    testWidgets('Render login screen widget', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester
          .pumpWidget(App()); // Replace MyApp with your app's main widget

      // Verify if the login screen is rendered
      expect(find.byType(LoginPage), findsOneWidget);
    });

    testWidgets('Validate login button tap', (WidgetTester tester) async {
      // Trigger a frame
      await tester
          .pumpWidget(App()); // Replace MyApp with your app's main widget

      // Tap on the login button
      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));

      // Trigger a frame
      await tester.pump();

      // Verify if the login functionality is triggered
      // Replace the condition and expectations based on your actual implementation
      expect(find.text('Dashboard'), findsOneWidget);
    });
  });
}
