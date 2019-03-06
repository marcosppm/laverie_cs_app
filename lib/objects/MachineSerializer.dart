import 'dart:core';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'Machine.dart';
import 'package:laverie_cs_app/enums/NotifierManager.dart';

class MachineSerializer {
  static Future<List<Machine>> readMachines(String path) async {
    print("readMachines");
    try {
      String contents = await rootBundle.loadString(path);
      return serializeMachines(contents);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<List<Machine>> serializeMachines(String content) async {
    List<Machine> machines = [];
    print("serializeMachines");
    print(content);

    List<String> lines = content.split('\r\n');
    print(lines);
    Machine m;
    for (int i = 0; i < lines.length; i+=5) {
      m = Machine.createMachine(
          _getArgument(lines[i]),
          _getArgument(lines[i+1]),
          _getArgument(lines[i+2]),
          _getArgument(lines[i+3])
      );
      machines.add(m);
    }

    return machines;
  }

  static Object _getArgument(String line) {
    Object arg;
    List<String> tokens = line.split(': ');
    switch (tokens[0]) {
      case 'WSH':
        arg = "Washer " + tokens[1];
        break;

      case 'DRY':
        arg = "Dryer " + tokens[1];
        break;

      case 'deadline':
        arg = DateTime.parse(tokens[1]);
        print('deadline ' + arg.toString());
        break;

      case 'cookie':
        arg = tokens[1];
        break;

      case 'notify':
        arg = NotifierManager.getNotifier(tokens[1]);
    }
    return arg;
  }
}
