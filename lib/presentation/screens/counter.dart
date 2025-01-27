import 'package:demo_app/cubit/counter/counter_cubit.dart';
import 'package:demo_app/cubit/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state is CounterChangeValue) {
              if (state.value == 10 || state.value == -10) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.value == 10
                          ? 'Counter reached 10!'
                          : 'Counter reached -10!',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            }
          },
          builder: (context, state) {
            if (state is CounterChangeValue) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Current Counter Value:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '${state.value}',
                      style: const TextStyle(
                          fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Current Counter Value: 0',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
