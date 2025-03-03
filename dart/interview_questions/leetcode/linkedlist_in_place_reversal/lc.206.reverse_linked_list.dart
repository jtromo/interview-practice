// 206. Reverse Linked List
// Solved
// Easy
// Topics
// Companies
// Given the head of a singly linked list, reverse the list, and return the reversed list.

// Example 1:

// Input: head = [1,2,3,4,5]
// Output: [5,4,3,2,1]
// Example 2:

// Input: head = [1,2]
// Output: [2,1]
// Example 3:

// Input: head = []
// Output: []

// Constraints:

// The number of nodes in the list is the range [0, 5000].
// -5000 <= Node.val <= 5000

// Definition for singly-linked list.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  @override
  String toString() {
    String print = "[";
    ListNode? current = this;
    while (current != null) {
      if (current == this) {
        print += "${current.val}";
      } else {
        print += ",${current.val}";
      }

      current = current.next;
    }
    print += "]";
    return print;
  }
}

class Solution {
  ListNode? reverseList(ListNode? head) {
    print("Start: ${head}");

    if (head == null) return null;

    ListNode? previous = null;
    ListNode? current = head;

    while (current != null) {
      ListNode? next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }

    return previous;
  }
}

void main() {
  print("Input 1: ${Solution().reverseList(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, null))))))}");
  print("Input 2: ${Solution().reverseList(ListNode(1, ListNode(2, null)))}");
  print("Input 3: ${Solution().reverseList(null)}");
}
