import 'package:flutter/material.dart';

import '../screens/pages/customer/money_calculation_button.dart';

Widget viewReportBuildContainer(
  BuildContext context,
) {
  return Stack(
    children: [
      Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0),
        width: MediaQuery.of(context).size.width,
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: const BorderRadius.all(Radius.circular(5.0)), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        // 'रु ${Calculator.parseString(operations.last)} ',
                        'रु 0.0 ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.lightGreen),
                      ),
                      Text("You will give")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "रु 0.0",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.redAccent),
                      ),
                      Text("You will get")
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              height: 5,
              thickness: 1.5,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'View Report',
                    style: TextStyle(color: Colors.blue),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.blue,
                  ),
                ],
              ),
              onTap: () => Navigator.pushNamed(context, MoneyCalculationButton.routeName),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ],
  );
}
