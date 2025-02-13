import 'package:block_pattern_flutter_app/ToDoList/to_do_list_bloc.dart';
import 'package:block_pattern_flutter_app/ToDoList/to_do_list_event.dart';
import 'package:block_pattern_flutter_app/ToDoList/to_do_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (BuildContext context,state) {
        return ListView.builder(
          itemCount: state.todoList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.todoList[index]??""),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  BlocProvider.of<ToDoBloc>(context).add(RemoveTodoEvent(state.todoList[index]));

                },
              ),
            );
          },
        );

      },),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          BlocProvider.of<ToDoBloc>(context).add(AddTodoEvent('Task 3 added'));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}