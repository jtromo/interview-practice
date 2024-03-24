/*
There is a garden with N slots. In each slot, there is a flower. The N flowers will bloom one by one in N days. In each day, there will be exactly one flower blooming and it will be in the status of blooming since then.
Given an array flowers consists of number from 1 to N. Each number in the array represents the place where the flower will open in that day.
For example, flowers[i] = x means that the unique flower that blooms at day i will be at position x, where i and x will be in the range from 1 to N.
Also given an integer k, you need to output in which day there exists two flowers in the status of blooming, and also the number of flowers between them is k and these flowers are not blooming.
If there isn't such day, output -1.
Example 1:
Input: 
flowers: [1,3,2]
k: 1
Output: 2
Explanation: In the second day, the first and the third flower have become blooming.
Example 2:
Input: 
flowers: [1,2,3]
k: 1
Output: -1
Note:
The given array will be in the range [1, 20000].
*/
void main() {
  bool checkBounds(int lower, int upper, List<bool> blooming) {
    bool isBlooming = false;
    for (int b = lower; b < upper; b++) {
      isBlooming = blooming[b];
      // Found one blooming
      if (isBlooming) {
        return false;
      }
    }

    // If none in between are blooming return answer
    return true;
  }

  int kEmptySlots(List<int> flowers, int k) {
    int count = flowers.length;
    List<bool> blooming = new List<bool>.filled(count, false);
    for (int i = 0; i < count; i++) {
      // Account for 1 indexed flowers
      int location = flowers[i] - 1;
      blooming[location] = true;
      int lower = location - (k + 1);
      if (lower >= 0 && blooming[lower]) {
        if (checkBounds(lower + 1, location, blooming)) {
          return i + 1;
        }
      }
      int upper = location + (k + 1);
      if (upper < count && blooming[upper]) {
        if (checkBounds(location + 1, upper, blooming)) {
          return i + 1;
        }
      }
    }

    return -1;
  }

  var flowers;
  var k;

  flowers = [1, 3, 2];
  k = 1;
  print('kEmptySlots: ${kEmptySlots(flowers, k)}');

  flowers = [6, 5, 8, 9, 7, 1, 10, 2, 3, 4];
  k = 2;
  print('kEmptySlots: ${kEmptySlots(flowers, k)}');
}