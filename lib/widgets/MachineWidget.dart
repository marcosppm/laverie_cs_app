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
  Duration remaining;

  MachineWidgetState(this.machine);

  @override
  void initState() {
    super.initState();
    setState(() {
      this.remaining = this.machine.getRemaining();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blueAccent),
      child: Column(
        children: [
          Image.asset(this.machine.getImageURL()),
          Text(this.machine.getName),
          Text(remainingToString()),
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
      decrement();
    });
  }

  void decrement() {
    remaining = Duration(seconds:remaining.inSeconds - 1);
  }

  String remainingToString() {
    return remaining.toString().substring(0, 8);
  }
}
