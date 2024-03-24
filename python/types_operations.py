doubleType = 12.0
dictType = { 1: "test"}
stringType = "this string"

print(f"\n\n== Equality ==")

print(f"\n- equals -")

# bad - does not work for subtypes Listkov principle
if type(dictType) == dict:
  print("Same type")
else:
  print("Different type")

# correct5
if isinstance(dictType,dict):
  print("Same type")
else:
  print("Different type")


print(f"\n- identity -")

# == should be for True False only
# is otherwise

# bad
print(doubleType == 12.0)

# good
print(doubleType is 12.0)

print(f"\n- bool -")

# not necessary to check if bool or is length != 0

# bad
if bool(doubleType):
  print(True)
if len(stringType) != 0:
  print(True)

# good
if doubleType:
  print(True)
if stringType:
  print(True)

