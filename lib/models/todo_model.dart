import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class Todo {
  final String todoId;
  final String todoDescription;
  final bool isCompleted;
  Todo({
    required this.todoId,
    required this.todoDescription,
    required this.isCompleted,
  });
}
