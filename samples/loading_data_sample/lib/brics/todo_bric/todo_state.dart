import 'package:loading_data_sample/models/todo_item.dart';

class TodoBaseState {}

class TodoInitialState extends TodoBaseState {}

class TodoLoadingState extends TodoBaseState {}

class TodoLoadedState extends TodoBaseState {
  List<TodoItem>? data;

  TodoLoadedState(this.data);
}

class TodoErrorState extends TodoBaseState {
  String message;

  TodoErrorState(this.message);
}
