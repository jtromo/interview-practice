part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class CounterResetPressed extends CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}
