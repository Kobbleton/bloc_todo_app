// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum Filter {
  all,
  active,
  completed
}

Uuid uuid = const Uuid();

class Todo extends Equatable {
  final String todoId;
  final String todoDescription;
  final bool isCompleted;
  Todo({
    String? todoId,
    required this.todoDescription,
    this.isCompleted = false,
  }) : todoId = todoId ?? uuid.v4();

  @override
  List<Object> get props => [todoId, todoDescription, isCompleted];

  @override
  String toString() =>
      'Todo(todoId: $todoId, todoDescription: $todoDescription, isCompleted: $isCompleted,)';

}
