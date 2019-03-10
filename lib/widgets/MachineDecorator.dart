import 'package:laverie_cs_app/objects/Machine.dart';
import 'package:flutter/material.dart';

class MachineDecorator {
  Machine machine;
  Color bgColor;
  String btnString;

  MachineDecorator(this.machine) {
    bgColor = this.getColor();
    btnString = this.getBtnString();
  }

  Color getColor() => (machine.isBusy() ? Colors.redAccent : Colors.greenAccent);

  String getBtnString() => (machine.isBusy() ? "ARRÊTER" : "PROGRAMMER");

}