import 'package:block_pattern_flutter_app/ToDoList/to_do_list_bloc.dart';
import 'package:block_pattern_flutter_app/ToDoList/to_do_list_event.dart';
import 'package:block_pattern_flutter_app/ToDoList/to_do_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    var blocProvider = BlocProvider.of<ToDoBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App using BLOC'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              onChanged: (v) {
                setState(() {
                  context.read<ToDoBloc>().add(ShowControllerTextEvent(text: v));
                  // context.read<ToDoBloc>().add(ShowControllerTextEvent());
                });
              },
              controller: BlocProvider.of<ToDoBloc>(context).controller,
              decoration: const InputDecoration(hintText: 'Write Task'),
            ),
          ),
          Expanded(
            child: BlocBuilder<ToDoBloc, ToDoState>(
              builder: (BuildContext context2, state) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.todoList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.todoList[index] ?? ""),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                blocProvider.add(
                                    RemoveTodoEvent(state.todoList[index]));
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Text(BlocProvider.of<ToDoBloc>(context).controller?.text ??
                        "")
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (blocProvider.controller?.text == null ||
              blocProvider.controller?.text == "") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Add Task First!'),
              ),
            );

          } else {
            blocProvider.add(AddTodoEvent(blocProvider.controller?.text ?? ""));
          }

          // controller.clear();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
