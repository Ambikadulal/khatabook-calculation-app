import 'package:flutter/material.dart';

import '../calculation/calculation_page.dart';

class MoneyCalculationButton extends StatelessWidget {
  static const String routeName = "money-cal";

  const MoneyCalculationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle styleGave =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 14), primary: Colors.redAccent);
    final ButtonStyle styleGot =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 14), primary: Colors.green);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jhone  Doe"),
      ),
      body: const Center(child: Text("Hello Jhone Doe Welcome!")),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
                buttonTheme: ButtonTheme.of(context).copyWith(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
            child: ElevatedButton(
              style: styleGave,
              onPressed: () => Navigator.pushNamed(context, CalculationPage.routeName),
              child: const Text(
                "YOU GAVE रु ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
                buttonTheme: ButtonTheme.of(context).copyWith(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
            child: ElevatedButton(
              style: styleGot,
              onPressed: () => Navigator.pushNamed(context, CalculationPage.routeName),
              child: const Text(
                "YOU GOT रु",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
