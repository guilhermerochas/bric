import 'package:dio/dio.dart';

export './todo_service.dart';

final jsonPlaceholderClient = Dio(
  BaseOptions(
    baseUrl: "https://jsonplaceholder.typicode.com/",
  ),
);
