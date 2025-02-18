import 'package:demo_app/cubit/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  int _value = 0;
  void increment() => emit(CounterChangeValue(++_value));
  void decrement() => emit(CounterChangeValue(--_value));
}
