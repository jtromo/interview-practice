import 'package:flutter/material.dart';

@immutable
sealed class CounterState {
  final int count;
  const CounterState({this.count = 0});
}

final class CounterInitial extends CounterState {
  const CounterInitial();
}

final class CounterUpdated extends CounterState {
  const CounterUpdated({required super.count});
}
