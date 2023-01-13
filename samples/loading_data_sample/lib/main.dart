import 'package:bric/bric.dart';
import 'package:flutter/material.dart';
import 'package:loading_data_sample/brics/todo_bric/todo_bric.dart';
import 'package:loading_data_sample/brics/todo_bric/todo_state.dart';

void main() => runApp(const MyAppContext());

class MyAppContext extends StatelessWidget {
  const MyAppContext({super.key});

  @override
  Widget build(BuildContext context) {
    return BricitProvider<TodoBric, TodoBaseState>(
      create: (_) => TodoBric(),
      child: const MyAppContainer(),
    );
  }
}

class MyAppContainer extends StatefulWidget {
  const MyAppContainer({super.key});

  @override
  State<MyAppContainer> createState() => _MyAppContainerState();
}

class _MyAppContainerState extends State<MyAppContainer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Todo Example"),
          actions: [
            IconButton(
              icon: const Icon(Icons.download),
              onPressed: () async {
                await context.of<TodoBric, TodoBaseState>().loadTodoData();
              },
            )
          ],
        ),
        body: BricitBuilder<TodoBric, TodoBaseState>(
          builder: (context, state) {
            if (state is TodoInitialState) {
              return const Center(
                child: Text("Clique no botão para carregar os dados!"),
              );
            }

            if (state is TodoLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is TodoLoadedState) {
              if (state.data == null) {
                return const Center(
                  child: Text("No data has been found"),
                );
              } else {
                return ListView.builder(
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(
                        state.data![index].title ?? "",
                      ),
                    );
                  }),
                  itemCount: state.data!.length,
                );
              }
            }

            if (state is TodoErrorState) {
              return Center(
                child: Text(state.message),
              );
            }

            return const Center();
          },
        ),
      ),
    );
  }
}
