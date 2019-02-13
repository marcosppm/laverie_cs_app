// Machine à laver OU à sécher (IMPLEMENTS)
import 'package:laverie_cs_app/enums/Notifier.dart';
import 'WashingMachine.dart';
import 'DryingMachine.dart';

abstract class Machine {
  String name;
  Duration remaining;
  String cookie;
  Notifier notifier;

  Machine(this.name, DateTime deadline, this.cookie, this.notifier) {
    this.remaining = deadline.difference(new DateTime.now());
  }

  static Machine createMachine(String name, DateTime deadline, String cookie, Notifier notifier) {
    Machine machine;
    if (name.contains("Washing")) {
      machine = new WashingMachine(name, deadline, cookie, notifier);
    }
    if (name.contains("Drying")) {
      machine = new DryingMachine(name, deadline, cookie, notifier);
    }
    return machine;
  }

  String get getName => name;

  Duration get getRemaining => remaining;

  Notifier get getNotifier => notifier;

  void set setNotifier(Notifier notifier) => this.notifier = notifier;

  void decrement() => remaining = Duration(seconds:remaining.inSeconds - 1);

  bool isBusy() => (remaining.inSeconds > 0);

  bool hasProgrammed(String cookie) => (cookie == this.cookie);

  String getImageURL();

  @override
  String toString() =>
      '$name: il reste ${remaining.toString()}';
}