import 'package:flutter/material.dart';

import '../database/calculator.dart';

Widget operationsList(List<String> operations) {
  return ListView.builder(
    itemCount: operations.length,
    itemBuilder: (BuildContext context, int i) {
      return ListTile(
        title: Text(operations[i]),
        onTap: () {
          Navigator.pop(context, operations[i]);
        },
        leading: Text(
          Calculator.parseString(operations[i]),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    },
  );
}
