late num result;

void main() {
  result = 0;

  var call = Calculator();
/*
  //AddCommand
  //SubCommand
  //MultiCommand
  //DivideCommand

  call.push(3); //1
  call.push(8); //2
  call.push(2); //3
  call.push(5); //4
  call.push(5); //5
  call.push(6); //6
  call.push(20); //7

  call.addcommand(AddCommand()); //7
  call.addcommand(MultiCommand()); //6
  call.addcommand(DivideCommand()); //5
  call.addcommand(AddCommand()); //4
  call.addcommand(AddCommand()); //3
  call.addcommand(SubCommand()); //2
  call.addcommand(AddCommand()); //1
  //Write in reverse order

  call.calculate(); */
}


class Calculator {
  List<num> stack = [];
  List<Command> operation = [];

  void push(num value){
    stack.add(value);

  }

  void addcommand(Command cmd){
    operation.add(cmd);
  }

  String calculate(){

    result = stack.last;
    stack.removeLast();

    for (var opp in operation) {
      opp.apply(stack);
    }

    //print("result of all operations Is == $result");
    //return "Result";
    return "result == $result";
  }

  execute(Command cmd){
    cmd.apply(stack);
  }

  clear() {
    result = 0;
    stack = [];
    operation = [];
  }
}

abstract class Command {
  void apply(List<num> stack);
}

class AddCommand implements Command {
  @override
  void apply(List<num> stack) {
    num addition = stack.last;
    stack.removeLast();

    result = result + addition;
  }
}

class SubCommand implements Command {
  @override
  void apply(List<num> stack) {
    num addition = stack.last;
    stack.removeLast();

    result = result - addition;
  }
}

class MultiCommand implements Command {
  @override
  void apply(List<num> stack) {
    num addition = stack.last;
    stack.removeLast();

    result = result * addition;
  }
}

class DivideCommand implements Command {
  @override
  void apply(List<num> stack) {
    num addition = stack.last;
    stack.removeLast();

    result = result / addition;
  }
}

class Stack {
  late List<num> stackList;

  Stack(){
    stackList = [];
  }

  push(num value){
    stackList.add(value);
  }

  pop(){
    stackList.removeLast();
  }

  num peek(){
    return stackList.last;
  }
}

