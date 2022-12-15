import 'package:flutter/material.dart';
import 'package:todo_app/pages/todos_page/create_todo.dart';
import 'package:todo_app/pages/todos_page/search_and_filter_todo.dart';


import 'todo_header.dart';


class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFF102436),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            child: Column(
              children: const [
                TodoHeader(),
                CreateTodo(),
                SizedBox(height: 20,),
                SearchAndFilterTodo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
