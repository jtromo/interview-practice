// 283. Move Zeroes
// Easy
// Topics
// Companies
// Hint
// Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

// Note that you must do this in-place without making a copy of the array.

// Example 1:

// Input: nums = [0,1,0,3,12]
// Output: [1,3,12,0,0]
// Example 2:

// Input: nums = [0]
// Output: [0]

// Constraints:

// 1 <= nums.length <= 104
// -231 <= nums[i] <= 231 - 1

// Follow up: Could you minimize the total number of operations done

class Solution {
  void moveZeroesSubOptimal(List<int> nums) {
    for (final (int index, int val) in nums.indexed) {
      if (val == 0) {
        if (index + 1 < nums.length) {
          for (int subIndex = index + 1; subIndex < nums.length; subIndex++) {
            if (nums[subIndex] != 0) {
              nums[index] = nums[subIndex];
              nums[subIndex] = 0;
              break;
            }
          }
        }
      }
    }

    print(nums);
  }

  void moveZeroes(List<int> nums) {
    var nonZeroIndex = -1;
    for (var index = 0; index < nums.length; index++) {
      if (nums[index] != 0) {
        nonZeroIndex++;
        nums[nonZeroIndex] = nums[index];
        if (nonZeroIndex != index) {
          nums[index] = 0;
        }
      }
    }

    print(nums);
  }
}

void main() {
  print("Input 1:");
  Solution().moveZeroes([0, 1, 0, 3, 12]);
  print("Input 2:");
  Solution().moveZeroes([0]);
}
