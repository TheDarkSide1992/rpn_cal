late num result;

void main() {
  result = 0;
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

    return "result == $result";
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

