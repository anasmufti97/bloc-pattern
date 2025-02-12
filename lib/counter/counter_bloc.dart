import 'package:bloc/bloc.dart';
import 'package:block_pattern_flutter_app/counter/counter_event.dart';
import 'package:block_pattern_flutter_app/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    if (state.counter > 0) {  // Condition to prevent decrementing below zero
      emit(state.copyWith(counter: state.counter - 1));
    }
    // emit(
    //   state.copyWith(counter: state.counter - 1),
    // );
  }
}
