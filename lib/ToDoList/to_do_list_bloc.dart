import 'package:block_pattern_flutter_app/ToDoList/to_do_list_event.dart';
import 'package:block_pattern_flutter_app/ToDoList/to_do_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String> todos = [];
  TextEditingController? controller = TextEditingController();



  ToDoBloc() : super(ToDoState()) {
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodoEvent>(_removeTodo);
    on<ShowControllerTextEvent>(_showControllerText);
  }

  _addTodo(AddTodoEvent event, Emitter<ToDoState> emit) {
    todos.add(event.task);
    emit(state.copyWith(todoList: List.from(todos)));
  }

  _removeTodo(RemoveTodoEvent event, Emitter<ToDoState> emit) {
    todos.remove(event.index);
    emit(state.copyWith(
      todoList: List.from(todos),
    ));
  }

  _showControllerText(ShowControllerTextEvent event, Emitter<ToDoState> emit) {
    emit(state.copyWith(controller: state.controller));
  }
}
