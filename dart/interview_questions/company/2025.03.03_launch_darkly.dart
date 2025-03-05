class Solution {
  int withReturn() {
    return 1;
  }

  void noReturn() {
    print("answer");
  }
}

void main() {
  print("Input 1: ${Solution().withReturn()}");
  print("Input 2: ${Solution().withReturn()}");
  print("Input 3: ${Solution().withReturn()}");

  print("Input 1:");
  Solution().noReturn();
  print("Input 2:");
  Solution().noReturn();
  print("Input 3:");
  Solution().noReturn();
}
