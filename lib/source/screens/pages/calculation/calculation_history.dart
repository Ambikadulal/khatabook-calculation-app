import 'package:flutter/material.dart';

import '../../../widgets/calculation_history_operations_list.dart';

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
        child: operationsList(operations),
      ),
    );
  }
}
