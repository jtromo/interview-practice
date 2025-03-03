// 3. Longest Substring Without Repeating Characters
// Attempted
// Medium
// Topics
// Companies
// Hint
// Given a string s, find the length of the longest substring without duplicate characters.

// Example 1:

// Input: s = "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.
// Example 2:

// Input: s = "bbbbb"
// Output: 1
// Explanation: The answer is "b", with the length of 1.
// Example 3:

// Input: s = "pwwkew"
// Output: 3
// Explanation: The answer is "wke", with the length of 3.
// Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

// Constraints:

// 0 <= s.length <= 5 * 104
// s consists of English letters, digits, symbols and spaces.

import 'dart:math';

class Solution {
  int lengthOfLongestSubstring(String s) {
    int maxLength = 0;
    Set<String> set = {};

    int left = 0;
    for (int right = 0; right < s.length; right++) {
      final char = s[right];

      while (set.contains(char)) {
        set.remove(s[left]);
        left++;
      }
      set.add(char);

      maxLength = max(maxLength, set.length);
    }
    return maxLength;
  }
}

void main() {
  print("Input 1: ${Solution().lengthOfLongestSubstring("abcabcbb")}");
  print("Input 2: ${Solution().lengthOfLongestSubstring("bbbbb")}");
  print("Input 3: ${Solution().lengthOfLongestSubstring("pwwkew")}");
}
