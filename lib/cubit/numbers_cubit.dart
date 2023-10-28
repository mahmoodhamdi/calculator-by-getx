import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculators/cubit/result_box_states.dart';
import 'package:stack/stack.dart';

class NumbersCubit extends Cubit<BoxsState> {
  NumbersCubit() : super(ResultBoxState());
  String result = "0";
  Stack<String> stack = Stack();
  List<String> inputs = ["0"];
  List<dynamic> outs = [];
  String operation = "0";
  List<String> first = [];
  List<String> firstOperator = [];
  List<String> second = [];
  String firstFinish = "";
  String secondFinish = "";
  double firstDouble = 0;
  double secondDouble = 0;
  int counter = 0;
  
  void operationText(String containerName) {
    if (containerName == "+" && operation == "0" ||
        containerName == "-" && operation == "0" ||
        containerName == "/" && operation == "0" ||
        containerName == "*" && operation == "0" ||
        containerName == "+/-" && operation == "0" ||
        containerName == "%" && operation == "0") {
    } else if (inputs.isNotEmpty &&
        (inputs.elementAt(inputs.length - 1) == "/" ||
            inputs.elementAt(inputs.length - 1) == "*" ||
            inputs.elementAt(inputs.length - 1) == "-" ||
            inputs.elementAt(inputs.length - 1) == "+" ||
            inputs.elementAt(inputs.length - 1) == "%" ||
            inputs.elementAt(inputs.length - 1) == "=" ||
            inputs.elementAt(inputs.length - 1) == "+/-") &&
        (containerName == "/" ||
            containerName == "+/-" ||
            containerName == "*" ||
            containerName == "+" ||
            containerName == "-" ||
            containerName == "=" ||
            containerName == "%")) {
      emit(OperationsState());
    } else if (containerName == "=") {
    } else if (operation == "0") {
      operation = containerName;
      emit(OperationsState());
    } else if (operation.length <= 19) {
      if (inputs.isNotEmpty) {
        if (inputs[0] == "0") {
          inputs.clear();
          emit(OperationsState());
        }
      }
      inputs.add(containerName);
      operation += containerName;

      emit(OperationsState());
    }
  }

  void clear() {
    operation = "0";
    if (inputs.isNotEmpty) {
      inputs.clear();
    }
    emit(OperationsState());
  }

  void removeElement() {
    if (inputs.isNotEmpty) {
      if (inputs.length == 1) {
        operation = "0";
        inputs.clear();
        emit(OperationsState());
      } else {
        inputs.removeLast();
        emit(OperationsState());
      }
      for (int i = 0; i < inputs.length; i++) {
        if (i == 0) {
          operation = inputs[i];
          emit(OperationsState());
        } else {
          operation += inputs[i];
          emit(OperationsState());
        }
      }
    }
  }
}
