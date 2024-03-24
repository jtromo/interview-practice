/*
Given a sorted array, two integers k and x, find the k closest elements to x in the array. 
The result should also be sorted in ascending order. If there is a tie, the smaller elements are 
always preferred.
Note:
The value k is positive and will always be smaller than the length of the sorted array.
Length of the given array is positive and will not exceed 104
Absolute value of elements in the array and x will not exceed 104
*/

List<int> findClosestElements(List<int> input, int k, int x) {
  List<int> elements = [];
  Map<int, List<int>> diffToIndex = {};

  int index = -1;
  for (int i = 0; i < input.length; i++) {
    int diff = (x - input[i]).abs();
    var indexArray = diffToIndex[diff] ?? new List<int>();
    indexArray.add(i);
    diffToIndex[diff] = indexArray;
  }

  List<int> sortedDiffs = diffToIndex.keys.toList()..sort();

  while (elements.length < k) {
    for (int diff in sortedDiffs) {
      for (int foundIndex in diffToIndex[diff]) {
        elements.add(input[foundIndex]);
        if (elements.length == k) {
          return elements..sort();
        }
      }
    }
  }

  return elements..sort();
}

List<int> findClosestElements2(List<int> input, int k, int x) {
  input.sort((a, b) => a == b ? 0 : (a-x).abs() - (b-x).abs());
  
  print(input);
 	input = input.sublist(0, k);
  return input..sort();
}

void main() {
  var input = [0, 1, 1, 1, 2, 3, 6, 7, 8, 9];
  var k = 9;
  var x = 4;
  print('findClosestElements: ${findClosestElements(input, k, x)}');
  print('findClosestElements2: ${findClosestElements2(input, k, x)}');
}