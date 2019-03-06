import 'package:flutter/material.dart';
import 'MachineWidget.dart';
import 'package:laverie_cs_app/objects/MachineSerializer.dart';
import 'package:laverie_cs_app/objects/Machine.dart';

class MachinesLayoutWidget extends StatefulWidget {
  //TODO one array per residence
  @override
  MachinesLayoutWidgetState createState() => MachinesLayoutWidgetState();
}

class MachinesLayoutWidgetState extends State<MachinesLayoutWidget> {
  List<MachineWidget> machinesWidgets;
  String path = 'assets/files/time_res1.txt';

  @override
  void initState() {
    super.initState();
    print("initState");
    this.machinesWidgets = [];
    MachineSerializer.readMachines(path).then((List<Machine> list) {
      List<Machine> machines = list;
      setState(() {
        machines.forEach(
          (machine) => machinesWidgets.add(MachineWidget(machine))
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return getMachinesLayout();
  }

  Container getMachinesLayout() {
    //TODO Scroller, improve the views
    int totalMachines = machinesWidgets.length;
    int columns = 2;

    List<Row> rowsWidgets = [];
    for (int index = 0; index < totalMachines; index+=2) {
      rowsWidgets.add(Row(children: [machinesWidgets[index], machinesWidgets[index + 1]]));//TODO Corriger
    }
    if (totalMachines % columns == 1) { //TODO Corriger
      //TODO Center
      rowsWidgets.add(Row(children: [machinesWidgets[totalMachines - 1]]));
    }
    Column col = Column(children: rowsWidgets);

    return Container(
      decoration: BoxDecoration(color: Colors.blueAccent),
      child: col,
    );
  }
}