def main():

    import functions

    print(functions.add(1, 4))

    # from functions import add
    # print(add(1, 4))

    import object_oriented

    test_user = object_oriented.User("email", "name", "pass", "title")

    test_user.get_user_info()

if __name__ == '__main__':
  main()
