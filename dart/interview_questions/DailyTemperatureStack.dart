/*
Given a list of daily temperatures, produce a list that, for each day in the input, tells you how many days you would have to wait until a warmer temperature. If there is no future day for which this is possible, put 0 instead.
For example, given the list temperatures = [73, 74, 75, 71, 69, 72, 76, 73], your output should be [1, 1, 4, 2, 1, 1, 0, 0].
Note: The length of temperatures will be in the range [1, 30000]. Each temperature will be an integer in the range [30, 100].
*/
import 'dart:collection';

void main() {
  List<int> dailyTemperatures(List<int> temperatures) {
    var warmer = List.filled(temperatures.length, 0);
    // Index of current warmer temp.
    var stack = new Queue<int>();

    for (int i = temperatures.length - 1; i >= 0; i--) {
      while (!stack.isEmpty && temperatures[i] >= temperatures[stack.first]) {
        stack.removeFirst();
      }
      warmer[i] = stack.isEmpty ? 0 : stack.first - i;
      stack.addFirst(i);
    }

    return warmer;
  }

  try {
    print('dailyTemperatures: ${dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73])}');
  } catch (e, st) {
    print(e);
    print(st);
  }
}
