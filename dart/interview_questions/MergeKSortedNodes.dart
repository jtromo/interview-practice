/*
Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.

Example:

Input:
[
  1->4->5,
  1->3->4,
  2->6
]
Output: 1->1->2->3->4->4->5->6
 */
import 'dart:collection';

class Node implements Comparable<Node> {
  int val;
  Node? next;

  Node(this.val, {this.next});

  int get hashCode => val;
  int compareTo(Node other) => val - other.val;
  bool operator ==(other) => other is Node && (other.val == val);

  @override
  String toString() {
    var string = '';
    Node? temp = this;
    while (temp != null) {
      string += '${temp.val}->';
      temp = temp.next;
    }
    return string;
  }
}

Node? mergeKsortedLists(List<Node?> lists) {
  if (lists.isEmpty) return null;

  List<int> sorted = [];
  for (var list in lists) {
    var node = list;
    while (node != null) {
      sorted.add(node.val);
      node = node.next;
    }
  }

  sorted.sort((val, val2) => val - val2);

  // set to temp node.
  Node node = new Node(0);
  var head = node;
  for (int val in sorted) {
    node.next = Node(val);
    node = node.next!;
  }

  return head.next;
}

Node? mergeKlists(List<Node?> lists) {
  if (lists.isEmpty) return null;
  ListQueue queue = new ListQueue.from(lists);

  var head = lists.first;
  var prev = head;
  while (queue.isNotEmpty) {
    Node? list = queue.removeFirst();
    var temp = list;
    list = list.next;
    prev.next = temp;
    prev = prev.next;
    if (list != null) {
      queue.addLast(list);
    }
  }

  return head;
}

void main() {
  var node1 = new Node(1);
  var node2 = new Node(2);
  var node1_1 = new Node(1);
  var node3 = new Node(3);
  var node4 = new Node(4);
  var node4_1 = new Node(4);
  var node5 = new Node(5);
  var node6 = new Node(6);

  List<Node> lists;
  node1.next = node4;
  node4.next = node5;
  print('List1: $node1');

  node1_1.next = node3;
  node3.next = node4_1;
  print('List2: $node1_1');

  node2.next = node6;
  print('List3: $node2');

  lists = [node1, node1_1, node2];

  print('mergeKsortedLists: ${mergeKsortedLists(lists)}');
}
