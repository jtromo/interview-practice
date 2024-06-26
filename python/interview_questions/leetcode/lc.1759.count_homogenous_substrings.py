# TODO: Finish
# 1759. Count Number of Homogenous Substrings
# Medium

# Hint
# Given a string s, return the number of homogenous substrings of s. Since the answer may be too large, return it modulo 10^9 + 7.

# A string is homogenous if all the characters of the string are the same.

# A substring is a contiguous sequence of characters within a string.



# Example 1:

# Input: s = "abbcccaa"
# Output: 13
# Explanation: The homogenous substrings are listed as below:
# "a"   appears 3 times.
# "aa"  appears 1 time.
# "b"   appears 2 times.
# "bb"  appears 1 time.
# "c"   appears 3 times.
# "cc"  appears 2 times.
# "ccc" appears 1 time.
# 3 + 1 + 2 + 1 + 3 + 2 + 1 = 13.
# Example 2:

# Input: s = "xy"
# Output: 2
# Explanation: The homogenous substrings are "x" and "y".
# Example 3:

# Input: s = "zzzzz"
# Output: 15


# Constraints:

# 1 <= s.length <= 105
# s consists of lowercase letters.

from collections import defaultdict

class Solution:
    def countHomogenous(self, s: str) -> int:
        countMap = defaultdict(int)
        currentSubstring = ""
        for char in s:
            # Add new substring and all parts

            # If different char, reset substring
            if (currentSubstring == "" or char != currentSubstring[0]):
                currentSubstring = char
            else:
                currentSubstring += char

            # Add all combos of substring to count
            for indx in range(len(currentSubstring)):
                countString = currentSubstring[indx:]
                countMap[countString] += 1

        total = 0
        for value in countMap.values():
            total += value
        return total


print("Input 1:", Solution().countHomogenous("abbcccaa"))
print("Input 2:", Solution().countHomogenous("xy"))
print("Input 3:", Solution().countHomogenous("zzzzz"))
