# One line anonymous function

print(f"== Lambda ==")
x = lambda x: x + 5

print(x(2))

x = lambda x, y: x + y
print(x(2,3))

print(f"\n== Map ==")

x = [1,2,3,4,5,6,6,7,435,234,73,4]

# create a new function where each item from list x as i and adds 2 to create a new list
test = map(lambda i: i + 2, x) # returns map
print(list(test))

print(f"\n== Filter ==")

# create a new function where a condition determines if the element i is added to the new list from x
test = filter(lambda i: i % 2 == 0, x) # returns map
print(list(test))

print(f"- use a func - ") # same idea but easier with lambda
def func(i):
    i = i * 3
    return i % 2 == 0

test = filter(func, x)
print(list(test))

