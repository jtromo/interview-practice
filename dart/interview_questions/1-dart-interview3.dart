// Write down question
// [1, 2, 3, 4]
// add one
// [1, 2, 3, 5]

// Clarifying questions
// Non empty?
// Integers 0-9?

// Talk out solution
// convert to string
// convert to integer
// add value
// convert to string
// convert to array

// Look at examples for edge cases
// [9, 9, 9]
// + 1
// [1, 0 , 0, 0]

// [0, 0, 1, 1]
// [0, 0, 1, 2]

// Ask if I should begin

void main() {
  bool bs(List<int>? list, int value) {
    if (list == null || list.isEmpty) return false;

    int left = 0;
    int right = list.length - 1;

    while (left < right) {
      int middle = left + (right - left) ~/ 2;
      if (list[middle] == value)
        return true;
      else if (value > list[middle]) {
        left = middle + 1;
      } else {
        right = middle - 1;
      }
    }

    return false;
  }

  bool bsRecursive(List<int>? list, int left, int right, int value) {
    if (list == null || list.isEmpty) return false;
    if (left > right) return false;

    int middle = left + (right - left) ~/ 2;

    if (list[middle] == value)
      return true;
    else if (value > list[middle]) {
      return bsRecursive(list, middle + 1, right, value);
    } else {
      return bsRecursive(list, left, middle - 1, value);
    }
  }

  List<int> list;

  list = [1, 3, 5, 6, 8, 9];
  print('bs: ${bs(list, 8)}');
  print('bsRecursive: ${bsRecursive(list, 0, list.length - 1, 8)}');

  String reverseRecurs(String? s) {
    if (s == null || s.isEmpty) {
      return '';
    }
    String reverseChar = s[0];

    if (!reverseChar.contains(new RegExp('[0-9a-zA-Z ]'))) {
      reverseChar = '';
    }

    return reverseRecurs(s.substring(1, s.length)) + reverseChar;
  }

  print('reversRecurs: ${reverseRecurs('this is my string')}');
  print('reversRecurs: ${reverseRecurs('t@#!his is @%my stri*(!ng')}');

  // 1234
  // *10 = 12340
  // %10 = 4
  // ~/10 = 123
  int reverseInt(int i) {
    if (i < 10) return i;

    int rev = 0;
    while (i != 0) {
      int rightDigit = i % 10;
      i ~/= 10;
      rev *= 10;
      rev += rightDigit;
    }

    return rev;
  }

  print('reverseInt: ${reverseInt(12345678)}');
  print('reverseInt: ${reverseInt(10000)}');
}
