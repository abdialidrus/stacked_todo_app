import 'package:stacked/stacked.dart';
import 'package:stacked_todo_app/app/app.locator.dart';
import 'package:stacked_todo_app/models/todo_model.dart';
import 'package:stacked_todo_app/services/todo_service.dart';
import 'package:stacked_todo_app/ui/views/todo/todo_view.form.dart';

class TodoViewModel extends FormViewModel {
  final _todoService = locator<TodoService>();

  List<TodoModel> todos = [];

  void updateTodos(List<TodoModel> newTodos) {
    todos.clear();
    todos.addAll(newTodos);
    rebuildUi();
  }

  String newTodoId() {
    final timeCreated = DateTime.now().millisecondsSinceEpoch;
    return timeCreated.toString();
  }

  void getTodos() {
    final newTodos = _todoService.getTodos();
    updateTodos(newTodos);
  }

  void addTodo() {
    String title = todoTitleInputValue!;
    final newTodo = TodoModel(id: newTodoId(), title: title, isDone: false);
    final newTodos = _todoService.createTodo(newTodo);
    updateTodos(newTodos);
  }

  void deleteTodo(TodoModel todo) {
    final newTodos = _todoService.deleteTodo(todo);
    updateTodos(newTodos);
  }

  void markToDoAsDone(TodoModel todo) {
    final updatedTodo = TodoModel(id: todo.id, title: todo.title, isDone: true);
    final newTodos = _todoService.updateTodo(updatedTodo);
    updateTodos(newTodos);
  }

  void markToDoAsUnDone(TodoModel todo) {
    final updatedTodo =
        TodoModel(id: todo.id, title: todo.title, isDone: false);
    final newTodos = _todoService.updateTodo(updatedTodo);
    updateTodos(newTodos);
  }
}

class TodoTitleValidator {
  static String? validateTodoTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Todo title is required';
    }

    return null;
  }
}
