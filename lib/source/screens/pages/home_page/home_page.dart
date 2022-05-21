import 'package:flutter/material.dart';
import 'package:khatabook_yarsalab_task/source/screens/pages/customer/add_customer.dart';

import '../../components/bottom_nav_bar/bottom_nav_bar.dart';
import '../../components/bottom_nav_bar/tab_item.dart';
import 'home_page_body.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "home-page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // data for testing
  // List<Client> testClients = [
  //   Client(fullName: "Raouf", address: "Rahiche", blocked: false, id: 0),
  //   Client(fullName: "Zaki", address: "oun", blocked: true, id: 1),
  //   Client(
  //     fullName: "oussama",
  //     address: "ali",
  //     blocked: false,
  //     id: 2,
  //   )
  // ];

  dynamic _currentTab = TabItem.home;

  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  final AppBar appBar = AppBar(
    elevation: 0,
    title: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.collections_bookmark,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "My business",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.edit,
          color: Colors.white,
          size: 20,
        )
      ],
    ),
  );
  final Icon icon = const Icon(
    Icons.person_add,
    color: Colors.white,
  );
  final Text labelText = const Text("Add Customer",
      style: TextStyle(
        color: Colors.white,
      )
      //Theme.of(context).textTheme.headline6,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: appBar,
      body: const HomePageBody(),
      floatingActionButton: FloatingActionButton.extended(
        icon: icon,
        onPressed: () => Navigator.pushNamed(context, AddCustomer.routeName, arguments: 0),
        label: labelText,
      ),
      bottomNavigationBar: BottomNavigation(currentTab: _currentTab, onSelectTab: _selectTab),
    );
  }
}
