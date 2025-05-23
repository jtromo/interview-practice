import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;

  CounterProvider({this.counter = 0});

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    notifyListeners();
  }

  void resetCounter() {
    counter = 0;
    notifyListeners();
  }
}
