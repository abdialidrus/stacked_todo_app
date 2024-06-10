import 'package:hive_flutter/hive_flutter.dart';

part 'todo_model.g.dart';

const todoBoxName = 'todo_box';

@HiveType(typeId: 1)
class TodoModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final bool isDone;

  TodoModel({required this.id, required this.title, required this.isDone});
}
