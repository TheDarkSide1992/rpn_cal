late num result;

void main() {
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

    for (var opp in operation) {
      opp.apply(stack);
    }

    var result = stack.last;
    return "= $result";
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
    num num1 = stack.last;
    stack.removeLast();
    num num2 = stack.last;
    stack.removeLast();

    stack.add(num1 + num2);
  }
}

class SubCommand implements Command {
  @override
  void apply(List<num> stack) {
    num num1 = stack.last;
    stack.removeLast();
    num num2 = stack.last;
    stack.removeLast();

    stack.add(num1 - num2);
  }
}

class MultiCommand implements Command {
  @override
  void apply(List<num> stack) {
    num num1 = stack.last;
    stack.removeLast();
    num num2 = stack.last;
    stack.removeLast();

    stack.add(num1 * num2);
  }
}

class DivideCommand implements Command {
  @override
  void apply(List<num> stack) {
    num num1 = stack.last;
    stack.removeLast();
    num num2 = stack.last;
    stack.removeLast();

    stack.add(num1 / num2);
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

