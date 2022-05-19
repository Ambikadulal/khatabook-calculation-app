import 'package:flutter/material.dart';

class MoneyCalculationButton extends StatelessWidget {
  static const String routeName = "money-cal";

  const MoneyCalculationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 14), primary: Colors.redAccent);
    return Scaffold(
      appBar: AppBar(
        title: const Text("some one"),
      ),
      body: Container(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
                buttonTheme: ButtonTheme.of(context).copyWith(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
            child: ElevatedButton(
              style: style,
              onPressed: () {},
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
              style: style,
              onPressed: () {},
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
