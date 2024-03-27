def main():
    numbers = [2, 4, 6, 7, 8, 9]

    print(numbers)

    print(f"\n- for in -")
    for number in numbers:
        print(number)

    print(f"\n- while -")
    i = 0
    while i < len(numbers):
        print(str(numbers[i]))
        i+=1

    print(f"\n- match -")
    lang = "PHP"
    # lang = input("What's the programming language you want to learn? ")

    match lang:
        case "JavaScript":
            print("You can become a web developer.")

        case "Python":
            print("You can become a Data Scientist")

        case "PHP":
            print("You can become a backend developer")

        case "Solidity":
            print("You can become a Blockchain developer")

        case "Java":
            print("You can become a mobile app developer")
        case _:
            print("The language doesn't matter, what matters is solving problems.")

if __name__ == '__main__':
    main()
