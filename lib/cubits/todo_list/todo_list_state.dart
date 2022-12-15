import 'package:equatable/equatable.dart';
import '../../models/todo_model.dart';

class TodoListState extends Equatable {
  final List<Todo> todoList;
  const TodoListState({
    required this.todoList,
  });

  factory TodoListState.initial() {
    return TodoListState(todoList: [
      Todo(todoId: '1', todoDescription: 'Clean the room'),
      Todo(todoId: '2', todoDescription: 'Wash the dish'),
      Todo(todoId: '3', todoDescription: 'Do homework'),
    ]);
  }

  @override
  String toString() => 'TodoListState(todoList: $todoList)';

  TodoListState copyWith({
    List<Todo>? todoList,
  }) {
    return TodoListState(
      todoList: todoList ?? this.todoList,
    );
  }

  @override
  List<Object> get props => [todoList];
}
