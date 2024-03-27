# Design Dynamic Array (Resizable Array)

# Design a Dynamic Array (aka a resizable array) class, such as an ArrayList in Java or a vector in C++.

# Your DynamicArray class should support the following operations:

# DynamicArray(int capacity) will initialize an empty array with a capacity of capacity, where capacity > 0.
# int get(int i) will return the element at index i. Assume that index i is valid.
# void set(int i, int n) will set the element at index i to n. Assume that index i is valid.
# void pushback(int n) will push the element n to the end of the array.
# int popback() will pop and return the element at the end of the array. Assume that the array is non-empty.
# void resize() will double the capacity of the array.
# int getSize() will return the number of elements in the array.
# int getCapacity() will return the capacity of the array.
# If we call void pushback(int n) but the array is full, we should resize the array first.

# Example 1:

# Input:
# ["Array", 1, "getSize", "getCapacity"]

# Output:
# [null, 0, 1]
# Example 2:

# Input:
# ["Array", 1, "pushback", 1, "getCapacity", "pushback", 2, "getCapacity"]

# Output:
# [null, null, 1, null, 2]
# Example 3:

# Input:
# ["Array", 1, "getSize", "getCapacity", "pushback", 1, "getSize", "getCapacity", "pushback", 2, "getSize", "getCapacity", "get", 1, "set", 1, 3, "get", 1, "popback", "getSize", "getCapacity"]

# Output:
# [null, 0, 1, null, 1, 1, null, 2, 2, 2, null, 3, 3, 1, 2]
# Note:

# The index i provided to get(int i) and set(int i) is guranteed to be greater than or equal to 0 and less than the number of elements in the array.

class DynamicArray:

    def __init__(self, capacity: int):
        self.capacity = capacity
        self.dynamic = [None] * capacity
    def get(self, i: int) -> int:
        return self.dynamic[i]

    def set(self, i: int, n: int) -> None:
        self.dynamic[i] = n

    def pushback(self, n: int) -> None:
        if self.getSize() >= self.getCapacity():
            self.resize()
        self.dynamic[self.getSize()] = n

    def popback(self) -> int:
        pop = self.dynamic[self.getSize()-1]
        self.dynamic[self.getSize()-1] = None
        return pop

    def resize(self) -> None:
        self.capacity *= 2
        self.dynamic.extend([None] * self.capacity)

    def getSize(self) -> int:
        return len(list(filter(lambda x: x != None, self.dynamic)))

    def getCapacity(self) -> int:
        return self.capacity
