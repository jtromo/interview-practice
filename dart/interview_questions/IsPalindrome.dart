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

void main() {
  bool isPalindrome(String s) {
    if (s.isEmpty) return true;
    var regexp = new RegExp('[a-zA-z0-9]');
    var filtered = s.split('').fold('', (prev, next) {
      if (regexp.hasMatch(next)) {
        return prev + next;
      }
      return prev;
    }).toLowerCase();
    
    print(filtered);
  
    int left = 0;
    int right = filtered.length-1;
  	while (left < right) {
      if (filtered[left] != filtered[right]) {
        return false;
      }
      left++;
      right--;
    }
    
    return true;
  }
  
  
  
  String s;
  
  s = 'race a car';
  print('isPal: ${isPalindrome(s)}');
  s = 'A man, a plan, a canal: Panama';
  print('isPal: ${isPalindrome(s)}');
}