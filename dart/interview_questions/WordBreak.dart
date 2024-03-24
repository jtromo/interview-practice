/*
Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.
Note:
The same word in the dictionary may be reused multiple times in the segmentation.
You may assume the dictionary does not contain duplicate words.
Solution uses memoization.
*/

void main () {
  bool wordRecursive(String s, Set<String> wordSet, int start, List<bool> memo) {
    if (s.length == start) {
      return true;
    }
    
    if (memo[start] != null) {
      return memo[start];
    }
    
    for (int i = start + 1; i <= s.length; i++) {
    	if (wordSet.contains(s.substring(start, i)) && wordRecursive(s, wordSet, i, memo)) {
        return memo[start] = true;
      }
    }
    
    return memo[start] = false;
  }
  
  bool wordBreak(String s, List<String> wordDict) {
    return wordRecursive(s, new Set<String>.from(wordDict), 0, new List<bool>(s.length));
  }
  
  void printSolution(String s, List<String> wordDict) {
    print('String: $s');
    print('WordDict: $wordDict');
    print(wordBreak(s, wordDict));
  }
  
  var s = 'aaaaaaa'; var wordDict = ['aaaa', 'aaa'];
  printSolution(s, wordDict);
  s = "catsandog"; wordDict = ["cats", "dog", "sand", "and", "cat"];
  printSolution(s, wordDict);
  s = "applepenapple"; wordDict = ["apple", "pen"];
  printSolution(s, wordDict);
}