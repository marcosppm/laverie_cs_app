import 'package:flutter/material.dart';
import 'package:laverie_cs_app/widgets/MachinesLayoutWidget.dart';

void main() => runApp(LaverieApp());

class LaverieApp extends StatelessWidget {
  final String machinesFilePath =  'assets/files/time_res1.txt';

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
              MachinesLayoutWidget(),
              MachinesLayoutWidget(),
              MachinesLayoutWidget(), //Icon(Icons.directions_bike)
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
}

