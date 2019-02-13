import 'dart:core';
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'Machine.dart';
import 'package:laverie_cs_app/enums/NotifierManager.dart';

class MachineSerializer {
  File file;
  List<Machine> machines;

  MachineSerializer(String path) {
    this.file = new File(path);
    this.machines = [];
  }

  List<Machine> getMachines() {
    List<Machine> machines = [];
    List<Object> args = [];

    Stream<List<int>> inputStream = file.openRead();

    inputStream
      .transform(utf8.decoder)       // Decode bytes to UTF-8.
      .transform(new LineSplitter()) // Convert stream to individual lines.
      .listen((String line) {        // Process results.
        Object arg = getArgument(line);
        if (arg != '') args.add(arg);
        else machines.add(Machine.createMachine(args[0], args[1], args[2], args[3]));
      },
    onDone: () { print('File is now closed.'); },
    onError: (e) { print(e.toString()); });
  }

  Object getArgument(String line) {
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