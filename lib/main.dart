import 'package:flutter/material.dart';
import 'package:laverie_cs_app/widgets/MachineWidget.dart';
import 'package:laverie_cs_app/objects/Machine.dart';
import 'package:laverie_cs_app/enums/NotifierManager.dart';

void main() => runApp(LaverieApp());

class LaverieApp extends StatelessWidget {
  final String machinesFilePath = 'assets/files/time_res1.txt';
  //TODO one array per residence
  List<MachineWidget> machinesWidgets;

  @override
  Widget build(BuildContext context) {
    machinesWidgets = [];

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
              loadMachinesLayout(),
              loadMachinesLayout(),
              loadMachinesLayout(), // Icon(Icons.directions_bike)
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

  Container loadMachinesLayout() {
    //TODO Scroller, improve the views
    int totalMachines = 4;
    int columns = 2;
    int rows = (totalMachines / columns).round();

    List<Row> rowsWidgets = [];
    int index = 0;
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        index = i * columns + j;
        machinesWidgets.add(
          MachineWidget(
            Machine.createMachine("Dryer", DateTime(1,1,1), "XXXX", NotifierManager.getNotifier("OK"))
          )
        );
      }
      if (index < totalMachines) {
        rowsWidgets.add(Row(children: [machinesWidgets[index - 1], machinesWidgets[index]]));
      } else {
        rowsWidgets.add(Row(children: [machinesWidgets[index]]));
      }
    }
    Column col = Column(children: rowsWidgets);

    return Container(
      decoration: BoxDecoration(color: Colors.blueAccent),
      child: col,
    );
  }
}
