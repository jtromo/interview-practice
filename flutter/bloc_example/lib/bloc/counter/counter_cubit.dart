import 'package:bloc_example/bloc/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial());

  void increment() => emit(CounterUpdated(count: state.count + 1));
  void decrement() => emit(CounterUpdated(count: state.count - 1));
  void reset() => emit(const CounterUpdated(count: 0));
}
