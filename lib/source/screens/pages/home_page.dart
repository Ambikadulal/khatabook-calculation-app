import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khatabook_yarsalab_task/source/database/local_database/demo_database.dart';
import 'package:khatabook_yarsalab_task/source/model/client_model.dart';
import 'package:khatabook_yarsalab_task/source/screens/pages/customer/add_customer.dart';

import '../components/bottom_nav_bar/bottom_nav_bar.dart';
import '../components/bottom_nav_bar/tab_item.dart';

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
        onPressed: () => Navigator.pushNamed(context, AddCustomer.routeName),
        label: labelText,
      ),
      bottomNavigationBar: BottomNavigation(currentTab: _currentTab, onSelectTab: _selectTab),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  // late final List<String> operations;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBody(
          context,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Customer List ",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        FutureBuilder<List<Client>>(
          future: DBProvider.db.getAllClients(),
          builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Client item = snapshot.data![index];
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(color: Colors.red),
                      onDismissed: (direction) {
                        DBProvider.db.deleteClient(item.id);
                      },
                      child: ListTile(
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              item.firstName,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              item.lastName,
                            ),
                          ],
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.id.toString()),
                        ),
                        trailing: Checkbox(
                          onChanged: (bool? value) {
                            DBProvider.db.blockOrUnblock(item);
                            setState(() {});
                          },
                          value: item.blocked,
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(child: Text("Please Add Customer."));
            }
          },
        ),
      ],
    );
  }
}

Widget _buildBody(
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
                        'रु  ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.lightGreen),
                      ),
                      Text("You will gave")
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
            Row(
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
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ],
  );
}
