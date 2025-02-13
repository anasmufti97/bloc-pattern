import 'package:equatable/equatable.dart';

class ToDoState extends Equatable {
  List<String> todoList = [];

  ToDoState({this.todoList = const []});

  ToDoState copyWith({List<String>? todoList}) {
    return ToDoState(todoList: todoList ?? this.todoList);
  }

  @override
  List<Object?> get props => [todoList];
}
