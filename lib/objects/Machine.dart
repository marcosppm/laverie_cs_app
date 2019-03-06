// Machine à laver OU à sécher (IMPLEMENTS)
import 'package:laverie_cs_app/enums/Notifier.dart';
import 'WashingMachine.dart';
import 'DryingMachine.dart';

abstract class Machine {
  String name;
  DateTime deadline;
  String cookie;
  Notifier notifier;

  Machine(this.name, this.deadline, this.cookie, this.notifier);

  static Machine createMachine(String name, DateTime deadline, String cookie, Notifier notifier) {
    Machine machine;
    if (name.contains("Washer")) {
      machine = new WashingMachine(name, deadline, cookie, notifier);
    }
    if (name.contains("Dryer")) {
      machine = new DryingMachine(name, deadline, cookie, notifier);
    }
    return machine;
  }

  get getName => name;

  get getDeadline => deadline;

  get getNotifier => notifier;

  set setNotifier(Notifier notifier) => this.notifier = notifier;

  Duration getRemaining() {
    DateTime now = new DateTime.now();
    print("diff: " + deadline.difference(now).toString());
    print("deadl: " + deadline.toString());
    print("now: " + now.toString());
    return deadline.difference(new DateTime.now());
  }

  bool isBusy() => (getRemaining().inSeconds > 0);

  bool hasProgrammed(String cookie) => (cookie == this.cookie);

  String getImageURL();

  @override
  String toString() =>
      '$name: il reste ${getRemaining().toString()}';
}