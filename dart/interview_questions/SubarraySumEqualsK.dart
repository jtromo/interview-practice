/*
Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
Example 1:
Input:nums = [1,1,1], k = 2
Output: 2
Note:
The length of the array is in range [1, 20,000].
The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].
*/

void main() {
  int subarraySum(List<int> nums, int k) {
    int ans = 0;

    for (int initial = 0; initial < nums.length; initial++) {
      int sum = 0;
      for (int start = initial; start < nums.length; start++) {
        sum += nums[start];
        if (sum == k) {
          ans++;
        }
      }
    }
    return ans;
  }
 
  var nums;
  var k;

  nums = [1, 1, 1];
  k = 2;

  print('nums: $nums \nk: $k \nsums: ${subarraySum(nums,k)}');
  
  nums = [1, 2, 3];
  k = 3;

  print('nums: $nums \nk: $k \nsums: ${subarraySum(nums,k)}');
}