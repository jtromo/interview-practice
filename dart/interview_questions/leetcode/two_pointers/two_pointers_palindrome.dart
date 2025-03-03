/*
Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

Note: For the purpose of this problem, we define empty string as valid palindrome.

Example 1:

Input: "A man, a plan, a canal: Panama"
Output: true
Example 2:

Input: "race a car"
Output: false
 */

class Solution {
  bool isPalindrome(String input) {
    input = input.toLowerCase();
    var valid = RegExp('[a-zA-Z0-9]');

    int startIndex = 0;
    int endIndex = input.length - 1;
    while (startIndex < endIndex) {
      final left = input[startIndex];
      // Skip anything not a letter or number
      if (!valid.hasMatch(left)) {
        startIndex++;
        continue;
      }
      final right = input[endIndex];
      // Skip anything not a letter or number
      if (!valid.hasMatch(right)) {
        endIndex--;
        continue;
      }

      if (left != right) {
        return false;
      }

      startIndex++;
      endIndex--;
    }
    return true;
  }
}

void main() {
  print("Input 1: ${Solution().isPalindrome("A man, a plan, a canal: Panama")}");
  print("Input 2: ${Solution().isPalindrome("race a car")}");
  print("Input 3: ${Solution().isPalindrome(" ")}");
  print("Input 4: ${Solution().isPalindrome("")}");
}
