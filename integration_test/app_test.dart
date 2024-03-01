// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/common.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rpn_calculator/main.dart';




void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Divide and get 10', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButton(tester, 'C');
    await tapButton(tester, '2');
    await tapButton(tester, '↲');
    await tapButton(tester, '2');
    await tapButton(tester, '0');
    await tapButton(tester, '↲');
    await tapButton(tester, '÷');
    await tapButton(tester, 'Calculate');
    expect(find.text("= 10"), findsOneWidget);
  });
  testWidgets('Multiply and get 40', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButton(tester, 'C');
    await tapButton(tester, '2');
    await tapButton(tester, '↲');
    await tapButton(tester, '2');
    await tapButton(tester, '0');
    await tapButton(tester, '↲');
    await tapButton(tester, '×');
    await tapButton(tester, 'Calculate');
    expect(find.text("= 40"), findsOneWidget);
  });

  testWidgets('Add and get 27', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButton(tester, 'C');
    await tapButton(tester, '7');
    await tapButton(tester, '↲');
    await tapButton(tester, '2');
    await tapButton(tester, '0');
    await tapButton(tester, '↲');
    await tapButton(tester, '+');
    await tapButton(tester, 'Calculate');
    expect(find.text("= 27"), findsOneWidget);
  });

  testWidgets('Sub and get 15', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButton(tester, 'C');
    await tapButton(tester, '5');
    await tapButton(tester, '↲');
    await tapButton(tester, '2');
    await tapButton(tester, '0');
    await tapButton(tester, '↲');
    await tapButton(tester, '-');
    await tapButton(tester, 'Calculate');
    expect(find.text("= 15"), findsOneWidget);
  });
}

Future<void> tapButton(WidgetTester tester, String buttonText) async{
  await tester.tap(find.text(buttonText));
  await tester.pump();
}