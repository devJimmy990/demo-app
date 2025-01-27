sealed class CounterState {}

class CounterInitial extends CounterState {
  final int count = 0;
  CounterInitial();
}

class CounterChangeValue extends CounterState {
  final int value;

  CounterChangeValue({required this.value});
}
