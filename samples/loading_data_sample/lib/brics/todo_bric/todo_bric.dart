import 'package:bric/bric.dart';
import 'package:dio/dio.dart';
import 'package:loading_data_sample/brics/todo_bric/todo_state.dart';
import 'package:loading_data_sample/services/services.dart';

class TodoBric extends Bricit<TodoBaseState> {
  final TodoService _todoService = TodoService();

  TodoBric() : super(TodoInitialState());

  Future loadTodoData() async {
    emit(TodoLoadingState());

    try {
      var todos = await _todoService.getTodos();
      emit(TodoLoadedState(todos));
    } on DioError catch (ex) {
      emit(TodoErrorState(ex.message));
    } on Exception catch (ex) {
      emit(TodoErrorState(ex.toString()));
    }
  }
}
