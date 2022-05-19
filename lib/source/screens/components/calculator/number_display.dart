import 'package:flutter/material.dart';

class NumberDisplay extends StatelessWidget {
  const NumberDisplay({Key? key, this.value = ''}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ));
  }
}
