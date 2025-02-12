import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object?> get props => [];
}

class SwitchValueChangeEvent extends SwitchEvent {}

class SliderValueEvent extends SwitchEvent {
  double slider = 0.5;

  SliderValueEvent({required this.slider});

  @override
  List<Object?> get props => [slider];
}
