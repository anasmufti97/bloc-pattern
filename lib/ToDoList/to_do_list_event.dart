import 'package:equatable/equatable.dart';

abstract class ToDoEvent extends Equatable {
  const ToDoEvent();
}

class AddTodoEvent extends ToDoEvent {
  final String task;

  const AddTodoEvent(this.task);

  @override
  List<Object?> get props => [task];
}

class ShowControllerTextEvent extends ToDoEvent {
  final String text;

  const ShowControllerTextEvent({required this.text});

  @override
  // TODO: implement props
  List<Object?> get props => [text];
}




class RemoveTodoEvent extends ToDoEvent {
  final Object index;

  const RemoveTodoEvent(this.index);

  @override
  List<Object?> get props => [index];
}
