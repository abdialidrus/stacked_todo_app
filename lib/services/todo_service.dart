import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked_todo_app/app/app.locator.dart';
import 'package:stacked_todo_app/models/todo_model.dart';
import 'package:stacked_todo_app/services/hive_service.dart';

class TodoService {
  final _todoBox = Hive.box<TodoModel>(todoBoxName);
  final _hiveService = locator<HiveService>();

  List<TodoModel> getTodos() {
    return _hiveService.loadBoxContents(_todoBox);
  }

  List<TodoModel> createTodo(TodoModel todo) {
    _hiveService.saveToBox(_todoBox, todo.id, todo);
    return _hiveService.loadBoxContents(_todoBox);
  }

  List<TodoModel> updateTodo(TodoModel todo) {
    _hiveService.saveToBox(_todoBox, todo.id, todo);
    return _hiveService.loadBoxContents(_todoBox);
  }

  List<TodoModel> deleteTodo(TodoModel todo) {
    _hiveService.deleteFromBox(_todoBox, todo.id);
    return _hiveService.loadBoxContents(_todoBox);
  }
}
