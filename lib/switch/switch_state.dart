import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  bool switchValue = false;
  double sliderValue = .2;

  SwitchState({this.switchValue = false, this.sliderValue = .2});

  SwitchState copyWith({bool? switchValue, double? sliderValue}) {
    return SwitchState(
      switchValue: switchValue ?? this.switchValue,
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }

  @override
  List<Object?> get props => [switchValue, sliderValue];
}
