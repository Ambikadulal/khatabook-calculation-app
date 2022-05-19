import 'package:flutter/material.dart';

class InputTextFields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FocusNode? focusNode;
  final TextInputType inputType;

  const InputTextFields(
      {Key? key, required this.controller, required this.hintText, this.focusNode, required this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          border: const OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}
