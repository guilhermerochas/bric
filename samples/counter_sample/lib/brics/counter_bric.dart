import 'package:bric/components/bricit.dart';

class CounterBric extends Bricit<int> {
  CounterBric() : super(0);

  void increment() => emit(value + 1);
  void decrement() => emit(value - 1);
}
