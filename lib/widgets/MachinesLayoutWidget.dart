import 'package:flutter/material.dart';
import 'MachineWidget.dart';
import 'package:laverie_cs_app/objects/MachineSerializer.dart';
import 'package:laverie_cs_app/objects/Machine.dart';
import 'package:laverie_cs_app/objects/Residence.dart';

class MachinesLayoutWidget extends StatefulWidget {
  //TODO one array per residence
  Residence res;

  MachinesLayoutWidget(this.res);

  @override
  MachinesLayoutWidgetState createState() => MachinesLayoutWidgetState(res);
}

class MachinesLayoutWidgetState extends State<MachinesLayoutWidget> {
  Residence res;
  List<MachineWidget> machinesWidgets;

  MachinesLayoutWidgetState(this.res);

  @override
  void initState() {
    super.initState();
    print("initState");
    this.machinesWidgets = [];
    MachineSerializer.readMachines(res.url).then((List<Machine> list) {
      List<Machine> machines = list;
      res.machines = list;
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

    List<Container> rowsWidgets = [];
    for (int index = 0; index < totalMachines; index+=2) {
      rowsWidgets.add(
          Container(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [machinesWidgets[index], machinesWidgets[index + 1]]
            )
          )
      );
    }
    if (totalMachines % columns == 1) { //TODO Corriger
      rowsWidgets.add(
          Container(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [machinesWidgets[totalMachines - 1]]
              )
          )
      );
    }
    Column col = Column(children: rowsWidgets);

    return Container(
      decoration: BoxDecoration(color: Colors.blueAccent),
      child: col,
    );
  }
}