import 'package:flutter/material.dart';
import 'package:laverie_cs_app/objects/Machine.dart';

class MachineWidget extends StatefulWidget {
  @override
  MachineWidgetState createState() => MachineWidgetState();
}

class MachineWidgetState extends State<MachineWidget> {
  String str = "Which machine?";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blueAccent),
      child: Column(
        children: [
          Image.asset('assets/images/machine_small.jpg'),
          Text(str),
          Text('Time'),
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
      str = "Machine 1";
    });
  }
}
