// 238. Product of Array Except Self
// Medium
// Topics
// Companies
// Hint
// Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

// The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

// You must write an algorithm that runs in O(n) time and without using the division operation.

// Example 1:

// Input: nums = [1,2,3,4]
// Output: [24,12,8,6]
// Example 2:

// Input: nums = [-1,1,0,-3,3]
// Output: [0,0,9,0,0]

// Constraints:

// 2 <= nums.length <= 105
// -30 <= nums[i] <= 30
// The input is generated such that answer[i] is guaranteed to fit in a 32-bit integer.

// Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)
class Solution {
  List<int> productExceptSelfBrute(List<int> nums) {
    var answer = <int>[];
    for (final (index, value) in nums.indexed) {
      var currentAnswer = 1;
      for (final (subIndex, subValue) in nums.indexed) {
        if (index == subIndex) {
          continue;
        }
        currentAnswer = currentAnswer * subValue;
      }
      answer.add(currentAnswer);
    }
    return answer;
  }

  List<int> productExceptSelfMemory(List<int> nums) {
    // prefix
    // Postfix

    var answer = <int>[];
    var product = 1;
    for (final (_, value) in nums.indexed) {
      product = product * value;
    }

    for (final (_, value) in nums.indexed) {
      if (value == 0) {}
      answer.add(product ~/ value);
    }
    return answer;
  }
}

void main() {
  // print("Input 1: ${Solution().productExceptSelfDivision([1, 2, 3, 4])}");
  // print("Input 2: ${Solution().productExceptSelfDivision([-1, 1, 0, -3, 3])}");
}
