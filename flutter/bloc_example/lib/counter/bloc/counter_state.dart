part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int count;
  const CounterState({this.count = 0});
}

final class CounterInitial extends CounterState {
  const CounterInitial();
}

final class CounterStateUpdated extends CounterState {
  const CounterStateUpdated({required super.count});
}
