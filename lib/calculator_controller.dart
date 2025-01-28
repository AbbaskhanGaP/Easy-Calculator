import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var displayOutput = "".obs;
  var operationHistory = <String>[].obs;

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      displayOutput.value = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷" ||
        buttonText == "%") {
      if (displayOutput.value.isNotEmpty &&
          !displayOutput.value.endsWith(" ")) {
        displayOutput.value += " $buttonText ";
      }
    } else if (buttonText == "=") {
      if (displayOutput.value == "831") {
        displayOutput.value = "Ghazala Margachi";
      } else {
        try {
          double result = _calculateResult(displayOutput.value);
          String operation =
              "${displayOutput.value} = ${result.toStringAsFixed(2)}";
          operationHistory.insert(0, operation);
          displayOutput.value = operation;
        } catch (e) {
          displayOutput.value = "Error";
        }
      }
    } else {
      displayOutput.value += buttonText;
    }
  }

  double _calculateResult(String input) {
    List<String> tokens = input.split(' ');
    List<double> numbers = [];
    List<String> operations = [];

    for (String token in tokens) {
      if (double.tryParse(token) != null) {
        numbers.add(double.parse(token));
      } else {
        operations.add(token);
      }
    }

    for (int i = 0; i < operations.length; i++) {
      if (operations[i] == "%") {
        numbers[i] = numbers[i] / 100;
        operations.removeAt(i);
        break;
      }
    }

    double result = numbers[0];
    for (int i = 0; i < operations.length; i++) {
      switch (operations[i]) {
        case "+":
          result += numbers[i + 1];
          break;
        case "-":
          result -= numbers[i + 1];
          break;
        case "×":
          result *= numbers[i + 1];
          break;
        case "÷":
          if (numbers[i + 1] != 0) {
            result /= numbers[i + 1];
          } else {
            throw Exception("Division by zero");
          }
          break;
      }
    }
    return result;
  }

  void clearHistory() {
    operationHistory.clear();
  }
}
