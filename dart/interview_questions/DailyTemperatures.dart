/*
Given a list of daily temperatures, produce a list that, for each day in the input, tells you how many days you would have to wait until a warmer temperature. If there is no future day for which this is possible, put 0 instead.
For example, given the list temperatures = [73, 74, 75, 71, 69, 72, 76, 73], your output should be [1, 1, 4, 2, 1, 1, 0, 0].
Note: The length of temperatures will be in the range [1, 30000]. Each temperature will be an integer in the range [30, 100].
*/
void main() {
  // Indexes of temps higher than key;
  Map<int, List<int>> amoMap = {};

  int firstIndexHigherThanTemp(int currentTemp, int startIndex) {
    List<int> keysGreaterThanCurrent = amoMap.keys.where((int key) => key >= currentTemp).toList()..sort();
    for (int key in keysGreaterThanCurrent) {
      int firstGreaterIndex = amoMap[key]?.firstWhere((index) => index > startIndex, orElse: () => -1) ?? -1;
      if (firstGreaterIndex != -1) {
        return firstGreaterIndex;
      }
    }

    return -1;
  }

  int warmerTemp(int currentTemp, int startIndex, int length, List<int> temperatures) {
    int amoIndex = firstIndexHigherThanTemp(currentTemp, startIndex);
    if (amoIndex != -1) {
      return amoIndex - startIndex;
    }

    int distance = 0;

    for (int i = startIndex; i < length; i++) {
      distance++;
      if (temperatures[i] > currentTemp) {
        List<int>? currentList = amoMap[currentTemp];
        currentList ??= [];
        currentList.add(i);
        amoMap[currentTemp] = currentList;
        return distance;
      }
    }

    return 0;
  }

  List<int> dailyTemperatures(List<int> temperatures) {
    List<int> warmer = List.filled(temperatures.length, 0);
    int length = temperatures.length;

    for (int i = 0; i < temperatures.length; i++) {
      int temperature = temperatures[i];
      warmer[i] = warmerTemp(temperature, i + 1, length, temperatures);
    }

    return warmer;
  }

  try {
    print('dailyTemperatures: ${dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73])}');
    print('amoMap: ${amoMap}');
  } catch (e, st) {
    print(e);
    print(st);
  }
}
