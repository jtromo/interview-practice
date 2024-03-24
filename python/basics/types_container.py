# complex: Lists, range(), Tuples

print("=== Lists ===")

print(f"\n- List basics -")

strings = ["James", "Tom", "Bob"]

print("list:")
print(strings)
print("  first element:")
print(strings[1])
print("  last element:")
print(strings[-1]) # last element
print("  two elements from end:")
print(strings[-2]) # second from end

print("  Change first element and print list:")
strings[0] = "Jimmy" # change element
print(strings)

print("  Print list range and do not modify list:")
print(strings[0:2]) # print range (does not modify)
print(strings)

print(f"\n- List methods -")

print("  list:")

numbers = [2, 4, 6, 7, 8, 9]
print(numbers)

print("  Insert 3 into index 1:")
numbers.insert(1, 3)
print(numbers)

print("  Append 14 to end:")
numbers.append(14)
print(numbers)

print("  len of list:")
print(len(numbers))

x = [1,2,3,4]
y = [5,6,7,8]
print("  Append list to end:")
print(f"x: {x}, y: {y}")
x.append(y)
print(x)

x = [1,2,3,4]
y = [5,6,7,8]
print("  add elements from list to end:")
print(f"x: {x}, y: {y}")
x.extend(y)
print(x)

print("  len of list:")
print(len(numbers))

print("  4 is in:")
print(4 in numbers)

print("  Remove 4:")
numbers.remove(4)
print(numbers)

print("  4 is in:")
print(4 in numbers)

print("  clear all:")
numbers.clear
print(numbers)

print(f"\n- operations - ")

print("  names longer than 3 characters")
longer_names = []
for name in strings:
    if len(name) > 3:
        longer_names.append(name)
print(longer_names)

print("  ListComprehensions: names longer than 3 characters")
longer_names2 = [name for name in strings if len(name) > 3]
print(longer_names2)


print(f"\n\n=== range() ===")

print("  Range of 5:")
range1 = range(5)
print(range1)
for number in range1:
    print(number)

print("  Range from 5 to 10:")
for number in range(5,10):
    print(number)

print("  Range from 5 to 10 every 2:")
for number in range(5,10,2):
    print(number)

print(f"\n\n=== Tuples ===") # used to make sure a list is not modified (immutable list)

print("  tuple1")
tuple1 = (1, 2, 3, 2)
print(tuple1)

print("  count")
print(tuple1.count(2))

print("  index")
print(tuple1.index(2))

print(f"\n\n=== Slice ===")

# x[start: stop: step]
sliceList = [0,1,2,3,4,5,6,7,8,9]

print("  slice1")
sliced1 = sliceList[0:4:1] # 0, 1, 2, 3
print(sliced1)

print("  slice2")
sliced2 = sliceList[2:6:2] # 2, 4
print(sliced2)

print("  reverse list")
slicedReverse = sliceList[::-1] # reversed
print(slicedReverse)

print("  slice3")
sliced3 = sliceList[2:] # 2, 3, 4, 5, 6, 7, 8, 9
print(sliced3)

print("  slice4")
sliced4 = sliceList[2:3] # 2
print(sliced4)

print("  slice5")
sliced5 = sliceList[:7:2] # 0, 2, 4, 6
print(sliced5)

# also works with strings, tuples, and any set

print(f"\n\n=== set() ===")
# unordered but quick to access O(n) constant time

testEmptySet = set() # cannot use {} as it is a dict

testSet = {42, 1, 7, 7, 4, 6}
testSubSet = {42, 1, 7, 7, 4}
testSet2 = {1, 4, 6, 9}

print("  print")
print(testSet)

print("  num in")
print(7 in testSet) # much faster than doing same with a list

print("  union")
print(testSet.union(testSet2))

print("  intersection")
print(testSet.intersection(testSet2))


print(f"\n\n=== dict() ===")
# key value pair (hash, map, etc)
# very fast to retrieve, etc. Hash collisons are possible, but constant type

testEmptySet = {}

testDict = {"key": 4, "key2": 9}

print("  print")
print(testDict)

print(f"\n- modifying - ")

print("  add")
testDict["new"] = 10
print(testDict)

print("  add new key type double")
testDict[12.0] = 120
print(testDict)

print("  add new key type int")
testDict[1] = 19
print(testDict)

print("  add new key diff type same value overwrites")
testDict[12] = 13
print(testDict)

print("  add new value type list")
testDict[20] = [1, 2, 3, 4]
print(testDict)

print("  delete")
del testDict["key2"]
print(testDict)

print(f"\n- accessing -")

print("  key in dict")
print("new" in testDict)

print("  value for key")
print(testDict["new"])

print("  values for dict")
print(testDict.values())

print("  values for dict as list")
print(list(testDict.values()))

print("  keys for dict")
print(testDict.keys())

print(f"\n- looping -")

print(f"  keys")
for key in testDict:
    print(key)

print(f"  keys then access values")
for key in testDict:
    print(testDict[key])

print(f"  keys + values")
for key, value in testDict.items():
    print(key, value)
