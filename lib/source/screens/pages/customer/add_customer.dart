import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khatabook_yarsalab_task/source/database/local_database/demo_database.dart';
import 'package:khatabook_yarsalab_task/source/model/client_model.dart';

import '../../components/text_field/input_text_field.dart';
import 'money_calculation_button.dart';

class AddCustomer extends StatefulWidget {
  static const String routeName = "add-customer";

  const AddCustomer({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  late final TextEditingController firstNameTextEditingController;
  late final TextEditingController lastNameTextEditingController;
  // late FocusNode nameFocusNode;
  // late FocusNode addressFocusNode;

  Client? model;
  List<Client>? modelList;

  @override
  void initState() {
    firstNameTextEditingController = TextEditingController();
    lastNameTextEditingController = TextEditingController();
    // nameFocusNode = FocusNode();
    // addressFocusNode = FocusNode();
    super.initState();
  }

  // @override
  // void dispose() {
  //   nameFocusNode.dispose();
  //   addressFocusNode.dispose();
  //   super.dispose();
  // }

  final AppBar appBar = AppBar(
    title: const Text(
      "Add Customer",
      style: TextStyle(fontSize: 14),
    ),
  );

  void onPressed() async {
    Client model = Client(
        blocked: false,
        id: 0,
        firstName: firstNameTextEditingController.text,
        lastName: lastNameTextEditingController.text);
    await DBProvider.db.newClient(model);
    setState(() {
      firstNameTextEditingController.text = "";
      lastNameTextEditingController.text = "";
    });
    // Navigator.of(context).pop();
    Navigator.pushNamed(context, MoneyCalculationButton.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InputTextFields(
            controller: firstNameTextEditingController,
            inputType: TextInputType.text,
            // focusNode: nameFocusNode,
            hintText: "First Name",
          ),
          InputTextFields(
            controller: lastNameTextEditingController,
            hintText: "Last Name",
            inputType: TextInputType.text,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.grey,
                child: const Text(
                  "Back",
                ),
              ),
              MaterialButton(
                onPressed: onPressed,
                child: const Text("Save"),
                color: Colors.blue,
              )
            ],
          )
        ],
      ),
    );
  }
}
