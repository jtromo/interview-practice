# https://neetcode.io/problems/singlyLinkedList

# Design Singly Linked List

# Design a Singly Linked List class.

# Your LinkedList class should support the following operations:

# LinkedList() will initialize an empty linked list.
# int get(int i) will return the value of the ith node (0-indexed). If the index is out of bounds, return -1.
# void insertHead(int val) will insert a node with val at the head of the list.
# void insertTail(int val) will insert a node with val at the tail of the list.
# int remove(int i) will remove the ith node (0-indexed). If the index is out of bounds, return false, otherwise return true.
# int[] getValues() return an array of all the values in the linked list, ordered from head to tail.
# Example 1:

# Input:
# ["insertHead", 1, "insertTail", 2, "insertHead", 0, "remove", 1, "getValues"]

# Output:
# [null, null, null, true, [0, 2]]
# Example 2:

# Input:
# ["insertHead", 1, "insertHead", 2, "get", 5]

# Output:
# [null, null, -1]
# Note:

# The index int i provided to get(int i) and remove(int i) is guranteed to be greater than or equal to 0.

class ListNode:

    def __init__(self, value, next_node = None):
        self.value = value
        self.next_node = next_node

class LinkedList:

    def __init__(self):
        self.head = None

    def get(self, index: int) -> int:
        if index < 0:
            return -1
        indx = 0
        prev_node = None
        current_node = self.head
        while current_node != None:
            if indx == index:
                return current_node.value
            indx += 1
            prev_node = current_node
            current_node = current_node.next_node
        return -1

    def insertHead(self, val: int) -> None:
        if self.head == None:
            self.head = ListNode(val)
        else:
            new_node = ListNode(val, self.head)
            self.head = new_node

    def insertTail(self, val: int) -> None:
        if self.head == None:
            self.head = ListNode(val)
        else:
            current_node = self.head
            while current_node.next_node != None:
                current_node = current_node.next_node
            current_node.next_node = ListNode(val)

    def remove(self, index: int) -> bool:
        if index < 0:
            return False
        indx = 0
        prev_node = None
        current_node = self.head
        while current_node != None:
            if indx == index:
                if prev_node == None:
                    self.head = current_node.next_node
                else:
                    prev_node.next_node = current_node.next_node
                    current_node = None
                return True
            indx += 1
            prev_node = current_node
            current_node = current_node.next_node
        return False


    def getValues(self) -> list[int]:
        values_list = []
        current_node = self.head
        while current_node != None:
            values_list.append(current_node.value)
            current_node = current_node.next_node

        return values_list
