import 'package:flutter/material.dart';
import 'package:laverie_cs_app/objects/Machine.dart';

class Equipment extends StatefulWidget {
  @override
  EquipmentState createState() => EquipmentState();
}

class EquipmentState extends State<Equipment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/machine.jpg'),
                fit: BoxFit.none,
              ),
              // ...
            ),
          ),
          Text('oi'),
          Text('oi'),
        ],
      ),
    );
  }
}
