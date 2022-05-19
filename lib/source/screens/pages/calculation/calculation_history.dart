import 'package:flutter/material.dart';

import '../../../database/calculator.dart';

class CalculationHistory extends StatelessWidget {
  const CalculationHistory({Key? key, required this.operations}) : super(key: key);

  final List<String> operations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculation History'),
        centerTitle: false,
      ),
      body: Center(
        child: _operationsList(operations),
      ),
    );
  }

  Widget _operationsList(List<String> operations) {
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
}
