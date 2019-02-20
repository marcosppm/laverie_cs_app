import 'Machine.dart';
import 'package:laverie_cs_app/enums/Notifier.dart';

class WashingMachine extends Machine {
  WashingMachine (String name, DateTime deadline, String cookie, Notifier notifier)
      : super(name, deadline, cookie, notifier);

  @override
  String getImageURL() {
    return 'assets/images/washer_small.jpg';
  }
}