import 'package:flutter/material.dart';

import '../../../database/local_database/demo_database.dart';
import '../../../model/client_model.dart';
import '../../../widgets/view_report_build.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  //TODO: Need to maintain state and update newly added client for that we need to work on init and others

  // late Future<List<Client>> _listFuture;
  // @override
  // void initState() {
  //   super.initState();
  //
  //   // initial load
  //   _listFuture = DBProvider.db.getAllClients();
  //   //updateAndGetList();
  // }
  //
  // dynamic refreshList() {
  //   // reload
  //   SchedulerBinding.instance?.addPostFrameCallback((_) => setState(() {
  //         _listFuture = updateAndGetList();
  //       }));;
  // }
  //
  // Future<List<Client>> updateAndGetList() async {
  //   // DBProvider.db.getClient;
  //   //the list here
  //   return DBProvider.db.getAllClients();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          viewReportBuildContainer(
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
            future:
                //_listFuture,
                DBProvider.db.getAllClients(),
            builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Client client = snapshot.data![index];
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(color: Colors.red),
                      onDismissed: (direction) {
                        DBProvider.db.deleteClient(client.id);
                      },
                      child: ListTile(
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              client.firstName,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              client.lastName,
                            ),
                          ],
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(client.id.toString()),
                        ),
                        trailing: Checkbox(
                          onChanged: (bool? value) {
                            DBProvider.db.blockOrUnblock(client);
                            setState(() {});
                          },
                          value: client.blocked,
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text("Please Add Customer."));
              }
            },
          ),
        ],
      ),
    );
  }
}
