// Machine à laver OU à sécher (IMPLEMENTS)
class Machine{
  String name;
  Duration remaining;

  Machine({this.name = "", this.remaining = const Duration(hours:0, minutes:0, seconds:0)});

  String get getName => name;

  Duration get getRemaining => remaining;

  void set setRemaining(Duration remaning) => this.remaining = remaning;

  void decrement() => remaining = Duration(seconds:remaining.inSeconds - 1);

  bool isBusy() => (remaining.inSeconds > 0);

  @override
  String toString() =>
      '$name: il reste ${remaining.toString()}';
}