/*
Given two 1d vectors, implement an iterator to return their elements alternately.
For example, given two 1d vectors:
v1 = [1, 2]
v2 = [3, 4, 5, 6]
By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1, 3, 2, 4, 5, 6].
Follow up: What if you are given k 1d vectors? How well can your code be extended to such cases?
Clarification for the follow up question - Update (2015-09-18):
The "Zigzag" order is not clearly defined and is ambiguous for k > 2 cases. If "Zigzag" does not look right to you, replace "Zigzag" with "Cyclic". For example, given the following input:
[1,2,3]
[4,5,6,7]
[8,9]
It should return [1,4,8,2,5,9,3,6,7].
*/
import 'dart:collection';

class ZigzagIterator {
  late DoubleLinkedQueue<ListQueue<int>> queue;

  ZigzagIterator(List<List<int>> lists) {
    List<ListQueue<int>> queues = lists.fold([], (prev, list) {
      if (list.isEmpty) {
        return prev;
      } else {
        return prev..add(new ListQueue<int>.from(list));
      }
    });
    queue = new DoubleLinkedQueue<ListQueue<int>>.from(queues);
  }

  int next() {
    ListQueue<int> intQueue = queue.removeFirst();
    int num = intQueue.removeFirst();
    if (intQueue.isNotEmpty) {
      queue.add(intQueue);
    }
    return num;
  }

  bool hasNext() {
    return (queue.isNotEmpty);
  }
}

void main() {
  try {
    var v1 = [1, 6, 10];
    var v2 = [2, 7];
    var v3 = [3, 8, 11, 13];
    var v4 = [4];
    var v5 = [5, 9, 12];
    var solution = [];
    var i = new ZigzagIterator([v1, v2, v3, v4, v5]);
    while (i.hasNext()) {
      solution.add(i.next());
    }
    print('solution: $solution');

    v1 = [1, 2];
    v2 = [];
    v3 = [];
    v4 = [];
    v5 = [];
    solution = [];
    i = new ZigzagIterator([v1, v2, v3, v4, v5]);
    while (i.hasNext()) {
      solution.add(i.next());
    }

    print('solution: $solution');

    v1 = [];
    v2 = [1, 2];
    v3 = [];
    v4 = [];
    v5 = [];
    solution = [];
    i = new ZigzagIterator([v1, v2, v3, v4, v5]);
    while (i.hasNext()) {
      solution.add(i.next());
    }

    print('solution: $solution');
  } catch (e, st) {
    print(st);
  }
}
