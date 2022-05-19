import 'package:flutter/material.dart';
import 'package:khatabook_yarsalab_task/source/screens/pages/customer/add_customer.dart';
import 'package:khatabook_yarsalab_task/source/screens/pages/customer/money_calculation_button.dart';
import 'package:khatabook_yarsalab_task/source/screens/pages/home_page.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case AddCustomer.routeName:
        return MaterialPageRoute(builder: (_) => const AddCustomer());

      case MoneyCalculationButton.routeName:
        return MaterialPageRoute(builder: (_) => const MoneyCalculationButton());
    }

    return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text("Error, Page not found"))));
  }
}
