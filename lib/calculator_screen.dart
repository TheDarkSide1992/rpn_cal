import 'package:flutter/material.dart';
import 'package:rpn_calculator/cal_logic.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  var call = Calculator();

  var currentValue = "";

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(title: Text(currentValue)),
        body: Container(
          child: Column(
            children: [
              Row(children: [
                _numbtn(1),
                _numbtn(2),
                _numbtn(3),
                _combtn(AddCommand(), "+")
              ]),
              Row(children: [
                _numbtn(4),
                _numbtn(5),
                _numbtn(6),
                _combtn(SubCommand(), "-")
              ]),
              Row(children: [
                _numbtn(7),
                _numbtn(8),
                _numbtn(9),
                _combtn(MultiCommand(), "*")
              ]),
              Row(children: [
                _clear(),
                _numbtn(0),
                _enter(),
                _combtn(DivideCommand(), "/")
              ]),
            ],
          ),
        ));
  }

  Widget _numbtn(int num) {
    return OutlinedButton(
      onPressed: () => currentValue += num.toString(),
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
    num number = currentValue.isNotEmpty ? int.parse(currentValue.trim()) : 0;
    return OutlinedButton(
      onPressed: () => call.push(number),
      child: Text("Enter"),
    );
  }

  Widget _clear() {
    return OutlinedButton(
      onPressed: () => call.clear(),
      child: Text("Clear"),
    );
  }
}
