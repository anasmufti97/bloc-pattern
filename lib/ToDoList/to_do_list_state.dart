import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ToDoState extends Equatable {
   TextEditingController? controller = TextEditingController();
  List<String> todoList = [];

  ToDoState({this.todoList = const [], this.controller});

  ToDoState copyWith({List<String>? todoList, TextEditingController? controller}) {
    return ToDoState(todoList: todoList ?? this.todoList, controller: controller?? this.controller);
  }

  @override
  List<Object?> get props => [todoList, controller];
}
