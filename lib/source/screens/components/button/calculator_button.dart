import 'package:flutter/material.dart';

typedef CalculatorButtonTapCallback = void Function({String buttonText});

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  final String text;
  final CalculatorButtonTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            width: 0.5,
          ),
        ),
        child: FlatButton(
          onPressed: () => onTap(buttonText: text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          padding: const EdgeInsets.all(30),
          highlightColor: Colors.blueGrey[100],
          splashColor: Colors.blueAccent[100],
        ),
      ),
    );
  }
}
