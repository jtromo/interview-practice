test_string = "test"
try:
    new_int = int(test_string)
    print(new_int)
except Exception as e:
    print(e)
    print("Not an int")


try:
    raise Exception("This is an exception")
except Exception:
# except: Do not ever do this as it will hit in non-exception cases like ^ C
    print(e)
finally:
    print("always")
