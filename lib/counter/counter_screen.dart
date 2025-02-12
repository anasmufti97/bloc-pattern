import 'package:block_pattern_flutter_app/counter/counter_bloc.dart';
import 'package:block_pattern_flutter_app/counter/counter_event.dart';
import 'package:block_pattern_flutter_app/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter with BLoC')),
      body: Column(
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                'Counter Value:${state.counter}',
                style: const TextStyle(fontSize: 24),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounter());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            heroTag: "decrement",
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounter());

            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
