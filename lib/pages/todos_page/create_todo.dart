import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/todo_list/todo_list_cubit.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final TextEditingController newTodoController = TextEditingController();

  @override
  void dispose() {
    newTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newTodoController,
      decoration: InputDecoration(labelText: 'What to do?'),
      onSubmitted: (String? todoDescription) {
        if (todoDescription != null && todoDescription.trim().isNotEmpty) {
          context.read<TodoListCubit>().addTodoToList(todoDescription);
          newTodoController.clear();
        }
      },
    );
  }
}
