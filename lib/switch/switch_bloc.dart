import 'package:block_pattern_flutter_app/switch/switch_event.dart';
import 'package:block_pattern_flutter_app/switch/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBlock extends Bloc<SwitchEvent, SwitchState> {
  SwitchBlock() : super(SwitchState()) {
    on<SwitchValueChangeEvent>(_switchValueChange);
    on<SliderValueEvent>(sliderValueChange);
  }

  void _switchValueChange
      (SwitchValueChangeEvent event, Emitter<SwitchState> emit)
  {
    emit(state.copyWith(switchValue: !state.switchValue));

  }


  void sliderValueChange
      (SliderValueEvent event, Emitter<SwitchState> emit) {

    emit(state.copyWith(sliderValue:event.slider));

  }




}
