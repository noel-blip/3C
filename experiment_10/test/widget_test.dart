
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:experiment_10/registration_form.dart';

void main() {
  testWidgets('Registration form displays UI components',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: RegistrationForm()),
    );

    expect(find.text('Registration'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
  });

  testWidgets('Empty name shows error',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: RegistrationForm()),
    );

    await tester.tap(find.text('Register'));
    await tester.pump();

    expect(find.text('Please enter your name'), findsOneWidget);
  });

  testWidgets('Entering name shows success',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: RegistrationForm()),
    );

    await tester.enterText(
      find.byType(TextField),
      'John',
    );

    await tester.tap(find.text('Register'));
    await tester.pump();

    expect(find.text('Registration successful'), findsOneWidget);
  });
}
