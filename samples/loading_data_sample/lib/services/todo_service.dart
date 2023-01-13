import '../models/todo_item.dart';
import 'services.dart';

class TodoService {
  final String basePath = "todos";

  Future<List<TodoItem>?> getTodos() async {
    var response = await jsonPlaceholderClient.get(basePath);
    return (response.data as List).map((e) => TodoItem.fromJson(e)).toList();
  }
}
