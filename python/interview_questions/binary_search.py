def BinarySearch(arr, low, high, x):
   # Binary Search:
   # arr --> sorted array
   # low --> lowest index
   # high --> highest index
   # x --> searched value


   if high >= low:
       mid = (high + low) // 2

       if arr[mid] == x:
           return mid
       elif arr[mid] > x:
           return binary_search(arr, low, mid - 1, x)
       else:
           return binary_search(arr, mid + 1, high, x)
   else:
       # Element is not present in the array
       return -1


def binary_search(arr, x):
   # initiation of BinarySearch recursion
   # arr --> unsorted array
   return BinarySearch(arr, 0, len(arr) - 1, x)

array = [0, 4, 6, 8, 9, 10, 12, 16, 29, 40]

print(binary_search(array, 9))
