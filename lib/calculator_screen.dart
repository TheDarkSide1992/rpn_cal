import 'package:flutter/material.dart';
import 'package:rpn_calculator/cal_logic.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var call = Calculator();

  var commandList = "";
  var numberList = "";
  var currentValue = "";
  var endResult = "";

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(title: Text(key: const Key("endResult"),endResult)),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(width: 15, color: Colors.transparent),
                  Text(key: const Key("currentValue"),currentValue),
                ],
              ),
              Row(
                children: [
                  Container(width: 15, color: Colors.transparent),
                  Text(key: const Key("commandList"),commandList),
                ],
              ),
              Row(
                children: [
                  Container(width: 15, color: Colors.transparent),
                  Text(key: const Key("numberList"),numberList),
                ],
              ),
              const Divider(),
              Row(children: [
                Container(width: 15, color: Colors.transparent),
                _numbtn(1),
                Container(width: 10, color: Colors.transparent),
                _numbtn(2),
                Container(width: 10, color: Colors.transparent),
                _numbtn(3),
                Container(width: 15, color: Colors.transparent),
                _combtn(AddCommand(), "+")
              ]),
              Container(height: 10, color: Colors.transparent),
              Row(children: [
                Container(width: 15, color: Colors.transparent),
                _numbtn(4),
                Container(width: 10, color: Colors.transparent),
                _numbtn(5),
                Container(width: 10, color: Colors.transparent),
                _numbtn(6),
                Container(width: 15, color: Colors.transparent),
                _combtn(SubCommand(), "-")
              ]),
              Container(height: 10, color: Colors.transparent),
              Row(children: [
                Container(width: 15, color: Colors.transparent),
                _numbtn(7),
                Container(width: 10, color: Colors.transparent),
                _numbtn(8),
                Container(width: 10, color: Colors.transparent),
                _numbtn(9),
                Container(width: 15, color: Colors.transparent),
                _combtn(MultiCommand(), "×")
              ]),
              Container(height: 10, color: Colors.transparent),
              Row(children: [
                Container(width: 15, color: Colors.transparent),
                _clear(),
                Container(width: 10, color: Colors.transparent),
                _numbtn(0),
                Container(width: 10, color: Colors.transparent),
                _enter(),
                Container(width: 13, color: Colors.transparent),
                _combtn(DivideCommand(), "÷")
              ]),
              Container(height: 10, color: Colors.transparent),
              Row(children: [
                Container(width: 55, color: Colors.transparent),
                _calculate(),
              ]),
            ],
          ),
        ));
  }

  Widget _numbtn(int num) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          currentValue += num.toString();
        });
      },
      child: Text(num.toString()),
    );
  }

  Widget _calculate() {
    return OutlinedButton(
      key: const Key("caalculateBtn"),
      onPressed: () {
        setState(() {
          _calculateResult();
        });
      },
      child: Text("Calcuclate"),
    );
  }

  Widget _combtn(Command command, String pretty) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _command(command, pretty);
        });
      },
      child: Text(pretty),
    );
  }

  Widget _enter() {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _enterlogic();
        });
      },
      child: Text("↲"),
    );
  }

  Widget _clear() {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _clearlogic();
        });
      },
      child: Text("C"),
    );
  }

  _command(Command command, String pretty) async {
    commandList = pretty + " " +  commandList;
    call.addcommand(command);
  }

  _enterlogic() async {
    num number = currentValue.isNotEmpty ? int.parse(currentValue.trim()) : 0;
    numberList = numberList + "  " + "$number";
    currentValue = "";

    call.push(number);
  }

  _calculateResult() async {
    var res = call.calculate();
    endResult = "= $res";
    commandList = "";
    numberList = "";
    currentValue = "";

    call.clear();
  }

  _clearlogic() async {
    commandList = "";
    numberList = "";
    currentValue = "";
    endResult = "";

    call.clear();
  }
}
