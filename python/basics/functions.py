def main():
    days_to_seconds = 24 * 60 * 60
    unit_name = "seconds"

    # types optional
    def days_to_units(num_of_days: int, custom_message: str):
        print(f"{num_of_days} days are {num_of_days * days_to_seconds} {unit_name}")
        print(custom_message)

    print(f"\n== Run function ==")
    days_to_units(40, f"Done\n")


    print(f"\n== Pass function in strings to function ==")
    num_of_days1 = 1
    days_to_units(num_of_days1, f"Finished days_to_units for {num_of_days1} days!")


    print(f"\n== Returns ==")
    # annotations optional for types
    def add(x: int, y: int) -> int:
        return x + y
    print(add(1,4))

    added = add(1,5)
    print(added)

    print(f"\n== Added to strings ==")

    one = 12
    two = 4

    print(f"Your result is: {add(int(one), int(two))}")

    print(f"\n== functions in functions ==")
    def func():
        print("func1")
        def func():
            print("func2")
        func()

    func()

    print(f"\n== return ==")

    def func(x, y):
        print("func()", x, y)
        return x + y

    print(func(4, 5))


    print(f"\n== return multiple as tuple ==")

    def func(x, y):
        print("func()", x, y)
        return x, y

    print(func(4, 5))

    result = func(4, 5)
    r1 = result[0]
    print("r1", r1)
    r2 = result[1]
    print("r2", r2)

    r1, r2 = func(4, 5)
    print("r1", r1)
    print("r2", r2)

    print(f"\n== return function ==")
    def func(x):
        print("func1")
        def func2():
            print("func2", x)
        return func2 # not calling but returning it

    print(" returned function")
    returnedFunc = func(4) # returned function
    print(" print returned function")
    print(returnedFunc)
    print(" run returned function")
    returnedFunc() # run returned function

    print(f"\n== default params ==")

    def func(x = 5):
        return x

    print(func())
    print(func(9))

    print(f"\n== default params None ==")

    def func(x, y = 6, z = None):
        print(x, y, z)

    func(1)
    func(1, 2)
    func(1, 2, 3)


    print(f"\n== unpack ==")
    # Takes a var and "spreads" it to args

    x = [4, 20, 59, 678]
    print("  Print list")
    print(x)
    print("  Unpack list")
    print(*x) # individual elements

    print("  pass list as args to function")
    def func(x, y):
        print(x, y)
    pairs = [(1, 2), (3, 4)]

    print("non-python way")
    for pair in pairs:
        func(pair[0], pair[1])
    print("python way")
    for pair in pairs:
        func(*pair) # unpack to pass

    print("  pass dict as args to function")
    func(**{"x":2, "y": 5}) # unpack twice to pass dict
    func(**{"y":5, "x": 2}) # order does not matter. Name args same as keys


    print(f"\n== *args/**kwargs ==")
    # Takes multiple args and "shrinks" it to single var

    def func(*args, **kwargs):
        print(args, kwargs)

    print("  positional arguments go to *args and named to **kwargs")
    func(1,2,3,4,5, one=0, two=1)

    def func(*args, **kwargs):
        print(*args, kwargs)

    print("  args can be unpacked, but unpacking kwargs would be: print(one=0, two=1) which aren't params for print")
    func(1,2,3,4,5, one=0, two=1)


    print(f"\n== scope ==")

    print(f"- global -")

    x = "tim" # global

    def func(name):
        x = name # new x = to name. But global x can be accessed

    print("  Before instance x changed")
    print(x)
    func("change")
    print("  After instance x changed")
    print(x)

    def funcGlobal(name):
        global x
        x = name

    print("  Before global x changed")
    print(x)
    funcGlobal("new")
    print("  After global x changed")
    print(x)

if __name__ == '__main__':
    main()
