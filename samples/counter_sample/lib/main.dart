import 'package:bric/bric.dart';
import 'package:counter_sample/brics/counter_bric.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CounterContainer());

class CounterContainer extends StatelessWidget {
  const CounterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BricitProvider<CounterBric, int>(
      create: (_) => CounterBric(),
      child: const CounterWidget(),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Bricit Counter Test"),
        ),
        body: BricitBuilder<CounterBric, int>(
          builder: (context, state) {
            if (state == 0) {
              return const Center(
                child: Text(
                  "There is no value",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              );
            }

            return Center(
              child: Text(
                "The current value is: $state",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.of<CounterBric, int>().increment(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
