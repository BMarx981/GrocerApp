import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocerapp/app.dart';
import 'package:grocerapp/presentation/view/features/login/login_page.dart';
import 'package:grocerapp/presentation/view/features/login/login_section.dart';

void main() {
  group('Login Screen Unit Test', () {
    test('Username validation', () {
      final result = LoginSection().validateUsername('username123');

      expect(result, null);
    });

    test('Empty username validation', () {
      final result = LoginSection().validateUsername('');

      expect(result, 'Please enter a valid user name');
    });

    test('Password validation', () {
      final result = LoginSection().validatePassword('password123');

      expect(result, null); // Assuming null means validation passed
    });

    test('Empty password validation', () {
      final result = LoginSection().validatePassword('');

      expect(result, 'Please enter a valid password');
    });
  });

  group('Login Screen Widget Test', () {
    testWidgets('Render login screen widget', (WidgetTester tester) async {
      FlutterError.onError = ignoredOverflowErrors;

      await tester.pumpWidget(App());

      expect(find.byType(LoginPage), findsOneWidget);
    });

    testWidgets('Validate login button tap', skip: true,
        (WidgetTester tester) async {
      FlutterError.onError = ignoredOverflowErrors;
      await tester.pumpWidget(App());

      await tester.tap(
        find.byKey(
          const Key('login_submit_button'),
        ),
      );

      await tester.pumpAndSettle(const Duration(minutes: 1),
          EnginePhase.sendSemanticsUpdate, const Duration(minutes: 1));

      expect(find.byKey(const Key('dashboard_appbar')), findsOneWidget);
    });
  });
}

void ignoredOverflowErrors(
  FlutterErrorDetails details, {
  bool forceReport = false,
}) {
  bool ifIsOverflow = false;
  bool isUnabletoLoadAsset = false;

  var exception = details.exception;
  if (exception is FlutterError) {
    ifIsOverflow = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("A RenderFlex overflowed by"),
    );
    isUnabletoLoadAsset = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("Unable to load asset"),
    );
  }

  if (ifIsOverflow || isUnabletoLoadAsset) {
    debugPrint("ignored Overflow error");
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}
