<h1 align="center">BRIC</h1>

<h3 align="center"> A simple Alternative to Bloc's Cubit using ValueNotifier</h3>

## Usage

Define your Bric state

```dart
class CounterBric extends Bricit<int> {
  CounterBric() : super(0);

  void increment() => emit(value + 1);
  void decrement() => emit(value - 1);
}
```

Then you can simply register it using `BricitProvider` and get the value using `BricitBuilder`

This sample is present in the `samples` folder

```dart
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

```
