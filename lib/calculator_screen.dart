import 'package:flutter/material.dart';
import 'package:rpn_calculator/cal_logic.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  static var call = Calculator();

  static var currentValue = "";

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Column(
        children: [
          _numbtn(1),
          _numbtn(2),
          _numbtn(3),
          _numbtn(4),
          _numbtn(5),
          _numbtn(6),
          _numbtn(7),
          _numbtn(8),
          _numbtn(9),
          _numbtn(0),
        ],
      ),
    );
  }

  Widget _numbtn(int num) {
    return OutlinedButton(
      onPressed: () => currentValue + num.toString(),
      child: Text(num.toString()),
    );
  }

  Widget _combtn(Command command, String pretty) {
    return OutlinedButton(
      onPressed: () => {},
      child: Text(pretty),
    );
  }

  Widget _enter() {
    int num = currentValue.trim() as int;

    return OutlinedButton(
      onPressed: () => call.push(num),
      child: Text("Enter"),
    );
  }
}
