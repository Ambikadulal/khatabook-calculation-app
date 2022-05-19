import 'package:flutter/material.dart';

import '../../../database/calculator.dart';
import '../../components/calculator/calculator_function.dart';
import '../../components/calculator/number_display.dart';
import 'calculation_history.dart';

class CalculationPage extends StatefulWidget {
  static const String routeName = "calculation-page";

  const CalculationPage({
    Key? key,
  }) : super(key: key);

  @override
  _CalculationPageState createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  bool isNewEquation = true;
  List<double> values = [];
  List<String> operations = [];
  List<String> calculations = [];
  String calculatorString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("You will give"),
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {
                _navigateAndDisplayHistory(context);
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            NumberDisplay(value: calculatorString),
            CalculatorButtons(onTap: _onPressed),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ));
  }

  _navigateAndDisplayHistory(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => CalculationHistory(operations: calculations)));

    if (result != null) {
      setState(() {
        isNewEquation = false;
        calculatorString = Calculator.parseString(result);
      });
    }
  }

  void _onPressed({String? buttonText}) {
    // Standard mathematical operations
    if (Calculations.OPERATIONS.contains(buttonText)) {
      return setState(() {
        operations.add(buttonText!);
        calculatorString += " $buttonText ";
      });
    }

    // On CLEAR press
    if (buttonText == Calculations.CLEAR) {
      return setState(() {
        operations.add(Calculations.CLEAR);
        calculatorString = "";
      });
    }

    // On Equals press
    if (buttonText == Calculations.EQUAL) {
      String newCalculatorString = Calculator.parseString(calculatorString);
      return setState(() {
        if (newCalculatorString != calculatorString) {
          // only add evaluated strings to calculations array
          calculations.add(calculatorString);
        }
        operations.add(Calculations.EQUAL);
        calculatorString = newCalculatorString;
        isNewEquation = false;
      });
    }

    if (buttonText == Calculations.PERIOD) {
      return setState(() {
        calculatorString = Calculator.addPeriod(calculatorString);
      });
    }

    setState(() {
      if (!isNewEquation && operations.isNotEmpty && operations.last == Calculations.EQUAL) {
        calculatorString = buttonText!;
        isNewEquation = true;
      } else {
        calculatorString += buttonText!;
      }
    });
  }
}
