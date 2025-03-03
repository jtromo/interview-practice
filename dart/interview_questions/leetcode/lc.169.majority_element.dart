// 169. Majority Element
// Easy
// Topics
// Companies
// Given an array nums of size n, return the majority element.

// The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

// Example 1:

// Input: nums = [3,2,3]
// Output: 3
// Example 2:

// Input: nums = [2,2,1,1,1,2,2]
// Output: 2

// Constraints:

// n == nums.length
// 1 <= n <= 5 * 104
// -109 <= nums[i] <= 109

// Follow-up: Could you solve the problem in linear time and in O(1) space?

class Solution {
  int majorityElement(List<int> nums) {
    int majority = nums.length ~/ 2;
    final numCount = <int, int>{};
    for (final (int index, int num) in nums.indexed) {
      numCount.update(
        num,
        (value) {
          return ++value;
        },
        ifAbsent: () {
          return 1;
        },
      );
      if (numCount[num]! > majority) {
        return num;
      }
    }
    return -1;
  }
}

void main() {
  print("Input 1: ${Solution().majorityElement([3, 2, 3])}");
  print("Input 2: ${Solution().majorityElement([2, 2, 1, 1, 1, 2, 2])}");
}
