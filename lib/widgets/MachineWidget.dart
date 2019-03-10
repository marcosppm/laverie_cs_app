import 'package:flutter/material.dart';
import 'package:laverie_cs_app/objects/Machine.dart';
import 'package:laverie_cs_app/widgets/MachineDecorator.dart';

class MachineWidget extends StatefulWidget {
  Machine machine;

  MachineWidget(this.machine);

  @override
  MachineWidgetState createState() => MachineWidgetState(this.machine);
}

class MachineWidgetState extends State<MachineWidget> {
  Machine machine;
  Duration remaining;
  MachineDecorator decorator;

  MachineWidgetState(this.machine);

  @override
  void initState() {
    super.initState();
    setState(() {
      this.decorator = MachineDecorator(this.machine);
      this.remaining = this.machine.getRemaining();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: decorator.getColor(),
          borderRadius: new BorderRadius.circular(15.0)),
      child: Column(
        children: [
          Image.asset(this.machine.getImageURL()),
          Text(this.machine.getName),
          Text(remainingToString()),
          ButtonTheme(
            minWidth: 125.0,
            buttonColor: Colors.white70,
            child: RaisedButton(
              child: Text(decorator.getBtnString()),
              onPressed: sayHello,
            ),
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
