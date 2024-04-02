# 2962. Count Subarrays Where Max Element Appears at Least K Times
# Medium

# You are given an integer array nums and a positive integer k.

# Return the number of subarrays where the maximum element of nums appears at least k times in that subarray.

# A subarray is a contiguous sequence of elements within an array.

# Example 1:

# Input: nums = [1,3,2,3,3], k = 2
# Output: 6
# Explanation: The subarrays that contain the element 3 at least 2 times are: [1,3,2,3], [1,3,2,3,3], [3,2,3], [3,2,3,3], [2,3,3] and [3,3].

# Example 2:

# Input: nums = [1,4,2,1], k = 3
# Output: 0
# Explanation: No subarray contains the element 4 at least 3 times.


# Constraints:

# 1 <= nums.length <= 105
# 1 <= nums[i] <= 106
# 1 <= k <= 105

# Solution

# Intuition
# The problem requires counting the number of subarrays where the maximum element of the array appears at least k times. This can be approached using a sliding window technique.

# Approach

# Find max element.
# l,r starting and ending point of current window.
# Iterate through the array with the r pointer, decrementing k whenever the element at r equals the maximum element.
# When k becomes zero, it indicates that the frequency of the maximum element in the current window has reached to k.
# Increment the l pointer until the frequency of the maximum element in the window becomes k-1.
# During this process, count the number of subarrays that can be formed using the current window. This count is equal to the number of elements to the left of the window with the maximum element included.
# Add this count to the answer.
# Continue this process until the r pointer reaches the end of the array.

# Complexity

# Time complexity:O(n)

# Space complexity:
# O(1)
# O(n)

from collections import defaultdict


class Solution:
    # O(n^3) bad
    def countSubarraysBrute(self, nums: list[int], k: int) -> int:
        maxValue = max(nums)
        subCount = 0

        for indxI in range(len(nums)):
            for indxJ in range(indxI, len(nums)):
                maxCount = 0
                for indxK in range(indxI, indxJ+1): # +1 because index
                    if nums[indxK] == maxValue:
                        maxCount += 1
                if maxCount >= k:
                    subCount += 1
        return subCount

    # k or more
    def countSubarrays(self, nums: list[int], k: int) -> int:
        valueCountDict = defaultdict(int) # tracks count of each value
        maxValue = max(nums)
        length = len(nums)
        subCount, left, right = 0,0,0
        while right < length:
            valueCountDict[nums[right]] += 1
            while valueCountDict[maxValue] >= k:
                subCount = subCount + length - right # length - right are the remaining elements which are also possible sub arrays
                valueCountDict[nums[left]] -= 1
                left += 1
            right += 1

        return subCount

    # exact k,m not k or more
    def countSubarraysExact(self, nums: list[int], k: int) -> int:
        maxValue = max(nums)
        subCount, maxCount, left, right = 0,0,0,0
        while right < len(nums):
            if nums[right] == maxValue:
                maxCount += 1
            if maxCount >= k:
                while maxCount >= k and left < right:
                    subCount += 1
                    if left < len(nums) and nums[left] == maxValue:
                        maxCount -= 1
                    left += 1
                if left == right:
                    right += 1
            else:
                right += 1
        return subCount

# nums = [1,3,2,3,3]
# print("Input: nums = [1,3,2,3,3], k = 2")
# print(Solution().countSubarraysBrute(nums, 2))

nums = [1,3,2,3,3]
print("k or more - Input: nums = [1,3,2,3,3], k = 2")
print(Solution().countSubarrays(nums, 2))

nums = [1,3,2,3,3]
print("Exactly k - Input: nums = [1,3,2,3,3], k = 2")
print(Solution().countSubarraysExact(nums, 2))

nums = [1,4,2,1]
print("Input: nums = [1,4,2,1], k = 3")
print(Solution().countSubarrays(nums, 3))
