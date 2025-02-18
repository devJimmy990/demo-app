sealed class CounterState {}

class CounterInitial extends CounterState {
  int count = 0;
  CounterInitial();
}

class CounterChangeValue extends CounterState {
  final int value;
  CounterChangeValue(this.value);
}
