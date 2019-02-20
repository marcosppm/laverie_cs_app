import 'dart:core';
import 'dart:io';
import 'dart:convert';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'package:path_provider/path_provider.dart';

import 'Machine.dart';
import 'package:laverie_cs_app/enums/NotifierManager.dart';
import 'package:laverie_cs_app/enums/Notifier.dart';
import 'package:laverie_cs_app/objects/WashingMachine.dart';

class MachineSerializer {
  /*static List<Machine> getMachines(String path) {
    File file = new File(path);
    List<Machine> machines = [];
    List<Object> args = [];

    Stream<List<int>> inputStream = file.openRead();
    print(path);

    inputStream
        .transform(utf8.decoder) // Decode bytes to UTF-8.
        .transform(new LineSplitter()) // Convert stream to individual lines.
        .listen((String line) {
      // Process results.
      Object arg = _getArgument(line);
      if (arg != '')
        args.add(arg);
      else
        machines.add(Machine.createMachine(args[0], args[1], args[2], args[3]));
    }, onDone: () {
      print('File is now closed.');
    }, onError: (e) {
      print(e.toString());
    });

    return machines;
  }
*/
  /*
  static List<Machine> getMachines(String path) {
    List<Machine> machines = [];
    List<Object> args = [];

    print(path);
    String data = "x";
    print(data);

    File file = new File('assets/files/time_res1.txt');
    file.readAsString().then((String contents) {
      print("Hey" + contents);
    });

    loadAsset().then((String result) {
      data = result;
      print(data);
    });
    print(machines.length);

      /*Object arg = _getArgument(line);
      if (arg != '') args.add(arg);
      else machines.add(Machine.createMachine(args[0], args[1], args[2], args[3]));*/
  }*/

  static Future<String> readMachines(String path) {
    print(path);
    String data = "x";
    print(data);

    File file = new File('assets/files/time_res1.txt');
    file.readAsString().then((String contents) {
      print("Hey" + contents);
    });

    return rootBundle.loadString('assets/files/time_res1.txt');
    /*
    loadAsset().then((String result) {
      data = result;
      print(data);
    });
    print(machines.length);
    */
    /*Object arg = _getArgument(line);
      if (arg != '') args.add(arg);
      else machines.add(Machine.createMachine(args[0], args[1], args[2], args[3]));*/
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
