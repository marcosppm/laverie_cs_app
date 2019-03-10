import 'package:flutter/material.dart';
import 'package:laverie_cs_app/widgets/MachinesLayoutWidget.dart';
import 'package:laverie_cs_app/objects/Residence.dart';

void main() => runApp(LaverieApp());

class LaverieApp extends StatelessWidget {
  List<Residence> residences;

  @override
  Widget build(BuildContext context) {
    this.residences = initResidences();
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: residences[0].abbreviation),
                Tab(text: residences[1].abbreviation),
                Tab(text: residences[2].abbreviation),
              ],
            ),
            title: Text('Laverie CS'),
          ),
          body: TabBarView(
            children: [
              MachinesLayoutWidget(residences[0]),
              MachinesLayoutWidget(residences[1]),
              MachinesLayoutWidget(residences[2]) //Icon(Icons.directions_bike)
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

  List<Residence> initResidences() {
    List<Residence> residences = [];
    residences.add(Residence("Résidence 1", "RES 1", "assets/files/time_res1.txt"));
    residences.add(Residence("Résidence 4B", "RES 4B", "assets/files/time_res4b.txt"));
    residences.add(Residence("Résidence 4DD", "RES 4DD", "assets/files/time_res4dd.txt"));
    return residences;
  }
}

