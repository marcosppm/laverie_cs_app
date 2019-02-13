import 'Machine.dart';
import 'package:laverie_cs_app/enums/Notifier.dart';

class DryingMachine extends Machine {
  DryingMachine (String name, DateTime deadline, String cookie, Notifier notifier)
      : super(name, deadline, cookie, notifier);

  @override
  String getImageURL() {
    return 'assets/images/drying_small.jpg';
  }
}