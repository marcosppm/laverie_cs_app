import 'package:flutter/material.dart';
import 'package:laverie_cs_app/objects/Machine.dart';

class MachineWidget extends StatefulWidget {
  Machine machine;

  MachineWidget(this.machine);

  @override
  MachineWidgetState createState() => MachineWidgetState(this.machine);
}

class MachineWidgetState extends State<MachineWidget> {
  Machine machine;

  MachineWidgetState(this.machine);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blueAccent),
      child: Column(
        children: [
          Image.asset(this.machine.getImageURL()),
          this.machine.getName(),
          this.machine.getRemaining(),
          RaisedButton(
            child: const Text('Set Machine'),
            onPressed: sayHello,

          )
        ],
      ),
    );
  }

  void sayHello() {
    setState(() {
      this.machine.decrement();
    });
  }
}
