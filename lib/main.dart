import 'package:flutter/material.dart';
import 'package:laverie_cs_app/widgets/MachineWidget.dart';
import 'package:laverie_cs_app/objects/Machine.dart';
import 'package:laverie_cs_app/objects/MachineSerializer.dart';

void main() => runApp(LaverieApp());

class LaverieApp extends StatelessWidget {
  final String machinesFilePath = 'assets/files/time_res1.txt';
  List<Machine> machines;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Rés 1"),
                Tab(text: "Rés 4B"),
                Tab(text: "Rés 4DD"),
              ],
            ),
            title: Text('Laverie CS'),
          ),
          body: TabBarView(
            children: [
              // loadMachineLayout(name: "Machine 1", remaining: Duration(minutes:30, seconds:0)),
              loadMachineLayout(),
              Icon(Icons.directions_transit), // loadMachineLayout()
              Icon(Icons.directions_bike), // loadMachineLayout()
            ],
          ),
          drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Options',
                  style: TextStyle(fontSize: 18.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Notifications'),
                trailing: Icon(
                  Icons.notifications,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Langue'),
                trailing: Icon(
                  Icons.language,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Contactez-nous'),
                trailing: Icon(
                  Icons.mail,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Tutorial'),
                trailing: Icon(
                  Icons.border_color,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Sur l\'appli'),
                trailing: Icon(
                  Icons.info,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ]),
          ),
        ),
      ),
      title: 'Laverie CS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  Widget loadMachineLayout() {
    print("oi");
    this.machines = MachineSerializer.getMachines(machinesFilePath);
    return MachineWidget(this.machines[0]);
  }
}
