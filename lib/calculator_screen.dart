import 'package:flutter/material.dart';
import 'package:rpn_calculator/cal_logic.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  var call = Calculator();

  var commandList ="Default";
  var numberList = "Default";
  var currentValue = "Default";
  var endResult="Default";

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(title: Text(currentValue)),
        body:
        Container(
          child: Column(
            children: [
              Row(children: [
                Text(currentValue)
              ],),
              Row(children: [
                Text(commandList)
              ],),
              Row(children: [
                Text(numberList)
              ],),
              Row(children: [
                Text(endResult)
              ],),
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
              Row(children: [
                _calculate(),
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

  Widget _calculate() {
    return OutlinedButton(
      onPressed: () => endResult = call.calculate().toString(),
      child: Text("Calcuclate"),
    );
  }


  Widget _combtn(Command command, String pretty) {

    return OutlinedButton(
      onPressed: () => _command(command, pretty),
      child: Text(pretty),
    );
  }

  Widget _enter() {
    return OutlinedButton(
      onPressed: () => _enterlogic(),
      child: Text("Enter"),
    );
  }


  Widget _clear() {
    return OutlinedButton(
      onPressed: () => _clearlogic(),
      child: Text("Clear"),
    );
  }

  _command(Command command, String pretty) async{
    commandList = pretty + commandList;
    call.addcommand(command);
  }

  _enterlogic() async{
    num number = currentValue.isNotEmpty ? int.parse(currentValue.trim()) : 0;
    numberList = numberList + "  " + currentValue.trim();
    currentValue = "";

    call.push(number);
  }

  _clearlogic() async{
    commandList="";
    numberList="";
    currentValue="";
    endResult="";

    call.clear();
  }
}
