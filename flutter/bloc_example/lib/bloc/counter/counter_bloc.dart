import 'package:bloc_example/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterResetPressed>((event, emit) {
      emit(const CounterInitial());
    });
    on<CounterIncrementPressed>((event, emit) {
      emit(CounterUpdated(count: state.count + 1));
    });

    on<CounterDecrementPressed>((event, emit) {
      emit(CounterUpdated(count: state.count - 1));
    });
  }
}
