import 'package:bloc/bloc.dart';
import 'package:todo_app/models/todo_model.dart';

import 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodoToList(String todoDescription) {
    final newTodo = Todo(todoDescription: todoDescription);
    final newTodoList = [...state.todoList, newTodo];

    emit(state.copyWith(todoList: newTodoList));
  }

  void editTodo(String requestId, String newTodoDescription) {
    final newTodoEdited = state.todoList.map((Todo todo) {
      if (todo.todoId == requestId) {
        return Todo(
            todoId: requestId,
            todoDescription: newTodoDescription,
            isCompleted: todo.isCompleted);
      }
      return todo;
    }).toList();

    emit(state.copyWith(todoList: newTodoEdited));
  }

  void toggleTodo(String requestId) {
    final newTodoToggled = state.todoList.map((Todo todo) {
      if (todo.todoId == requestId) {
        return Todo(
          todoId: requestId,
          todoDescription: todo.todoDescription,
          isCompleted: !todo.isCompleted,
        );
      }
      return todo;
    }).toList();

    emit(state.copyWith(todoList: newTodoToggled));
  }

  void removeTodo(Todo todo) {
    final newTodoRemoved =
        state.todoList.where((Todo t) => t.todoId != todo.todoId).toList();
    emit(state.copyWith(todoList: newTodoRemoved));
  }
}
