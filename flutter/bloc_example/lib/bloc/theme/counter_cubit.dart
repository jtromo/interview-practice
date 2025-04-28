import 'package:bloc_example/bloc/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial());

  void increment() => emit(CounterStateUpdated(count: state.count + 1));
  void decrement() => emit(CounterStateUpdated(count: state.count - 1));
  void reset() => emit(const CounterStateUpdated(count: 0));
}
