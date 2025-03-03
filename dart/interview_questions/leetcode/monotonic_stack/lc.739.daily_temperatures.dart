// 739. Daily Temperatures
// Attempted
// Medium
// Topics
// Companies
// Hint
// Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.

// Example 1:

// Input: temperatures = [73,74,75,71,69,72,76,73]
// Output: [1,1,4,2,1,1,0,0]
// Example 2:

// Input: temperatures = [30,40,50,60]
// Output: [1,1,1,0]
// Example 3:

// Input: temperatures = [30,60,90]
// Output: [1,1,0]

// Constraints:

// 1 <= temperatures.length <= 105
// 30 <= temperatures[i] <= 100

// class Solution {
//   List<int> dailyTemperatures(List<int> temperatures) {
//     final n = temperatures.length;
//     List<int> answer = List<int>.filled(n, 0);
//     // has indexes with greatest value on bottom - decreasing stack
//     List<int> stack = [];

//     for (int i = 0; i < n; i++) {
//       while (stack.isNotEmpty && temperatures[i] > temperatures[stack.first]) {
//         // Stack has index of the value that is smaller than the new value
//         final smallerIndex = stack.removeAt(0);
//         // subtract the next index from the current to get the number of days
//         answer[smallerIndex] = i - smallerIndex;
//       }

//       // add index to stack
//       stack.insert(0, i);
//     }

//     return answer;
//   }
// }

class Solution {
  List<int> dailyTemperatures(List<int> temperatures) {
    final n = temperatures.length;
    List<int> answer = List<int>.filled(n, 0);
    // has indexes with greatest value on bottom - decreasing stack
    List<int> stack = [];

    for (int i = 0; i < n; i++) {
      while (stack.isNotEmpty && temperatures[i] > temperatures[stack.last]) {
        // Stack has index of the value that is smaller than the new value
        final smallerIndex = stack.removeLast();
        // subtract the next index from the current to get the number of days
        answer[smallerIndex] = i - smallerIndex;
      }

      // add index to stack
      stack.add(i);
    }

    return answer;
  }
}

void main() {
  print("Input 1: ${Solution().dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73])}");
  print("Input 2: ${Solution().dailyTemperatures([30, 40, 50, 60])}");
  print("Input 3: ${Solution().dailyTemperatures([30, 60, 90])}");
}
