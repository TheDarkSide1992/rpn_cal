// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rpn_calculator/main.dart';
import 'package:rpn_calculator/cal_logic.dart';

var testClass = Calculator();

void main() {
  group('PushCommand', () {
    test('Push value to the stack', (){
      testClass.stack = [1,2];
      testClass.push(3);
      expect(testClass.stack, [1,2,3]);
    });
  });
  group('AddCommand', () {
    test('Remove numbers and get result', (){
      testClass.stack = [1, 2];
      AddCommand().apply(testClass.stack);
      expect(testClass.stack, [3]);
    });
  });
  group('SubCommand', () {
    test('Remove numbers and get result', (){
      testClass.stack = [1, 2];
      SubCommand().apply(testClass.stack);
      expect(testClass.stack, [1]);
    });
  });
  group('MultiCommand', () {
    test('Remove numbers and get result', (){
      testClass.stack = [3, 2];
      MultiCommand().apply(testClass.stack);
      expect(testClass.stack, [6]);
    });
  });
  group('DivideCommand', () {
    test('Remove numbers and get result', (){
      testClass.stack = [2, 8];
      DivideCommand().apply(testClass.stack);
      expect(testClass.stack, [4]);
    });
  });
  group('Calculate method', () {
    test('Return string with result', (){
      testClass.stack = [2 ,3, 5, 2, 3];
      testClass.operation = [SubCommand(), MultiCommand(), AddCommand(), DivideCommand()];
      var result = testClass.calculate();
      expect(result, 4);
    });
  });
}
