// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:todo_app/cubits/todo_list/todo_list_cubit.dart';
import '../../models/todo_model.dart';
import '../todo_list/todo_list_state.dart';
import 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  late final StreamSubscription todoListSubscription;
  final TodoListCubit todoListCubit;
  ActiveTodoCountCubit({
    required this.todoListCubit,
  }) : super(ActiveTodoCountState.initial()) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      print('todoListState: $todoListState');

      final int currentActiveTodoCount = todoListState.todoList
          .where((Todo todo) => !todo.isCompleted)
          .toList()
          .length;

      emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
    });
  }
  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
