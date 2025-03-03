class Solution {
  List<int> monotonicStackGreater(List<int> nums) {
    int n = nums.length;
    List<int> result = List<int>.filled(n, -1);

    // stores indexes with largest value on bottmo
    List<int> stack = [];

    for (var index = 0; index < nums.length; index++) {
      // Stack has elements and top value is greater than current element
      while (stack.isNotEmpty && nums[index] > nums[stack.first]) {
        // Stack has index of the value that is smaller than the new value
        final stackIndex = stack.removeAt(0);
        // This is where the answer would be.
        // In this case it is the value of the next highest but can be anything.
        result[stackIndex] = nums[index];
      }

      // stack is empty or element is smaller
      stack.insert(0, index);
    }

    return result;
  }
}

void main() {
  // Find the next greater element for each number in an array
  print("Input 1: ${Solution().monotonicStackGreater([2, 1, 5, 6, 2, 3])}");
  // print("Input 2: ${Solution().monotonicStack()}");
  // print("Input 3: ${Solution().monotonicStack()}");
}
