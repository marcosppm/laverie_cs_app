import 'package:laverie_cs_app/objects/Machine.dart';

class Residence {
  String name;
  String abbreviation;
  String url;
  List<Machine> machines;

  Residence(this.name, this.abbreviation, this.url);

  get getName => this.name;

  get getUrl => this.url;

  set setMachines(List<Machine> machines) => this.machines = machines;
}