import 'package:flutter/material.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("state.todos[index]"),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          for(int i = 0 ; i < 10 ; i++ ){
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}