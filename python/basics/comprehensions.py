def main():
  # one line initialization of a group.
  # first variable is passed to the loop and returned as the result

  print(f"- 0 passed into for loop for range amount of times - ")
  x = [0 for result in range(5)]
  print(x)

  print(f"\n- variable passed into for loop as for range amount of times - ")
  x = [result for result in range(5)]
  print(x)

  print(f"\n- variable modified then passed into for loop as for range amount of times - ")
  x = [result + 4 for result in range(5)]
  print(x)

  print(f"\n- variable passed into for loop as for range amount of times with condition (even) - ")
  x = [result + 4 for result in range(5) if result % 2 == 0] # print even numbers
  print(x)

  print(f"\n- list passed into for loop to be returned range amount of times - ")
  x = [[0, 1, 2, 3] for result in range(5)] # creating a list containing the first list 5 times
  print(x)

  print(f"\n- comprehension passed to comprehension resulting in same result  - ")
  x = [[result for result in range(4)] for result in range(5)] # same
  print(x)

  print(f"\n- for set - ")
  x = {result for result in range(5)}
  print(x)

  print(f"\n- for dict - ")
  x = {result:0 for result in range(5)}
  print(x)

  print(f"\n- for tuple - ")
  x = tuple(result for result in range(5))
  print(x)

  print(f"\n- generator - ")
  x = (result for result in range(5))
  print(x)


  print(f"\n\n== Tasks ==")

  print(f"\n- squares -")
  x = {i: i * i for i in range(10)}
  print(x)

  print(f"\n- odd squares -")
  x = {i: i * i for i in range(10) if i% 2 !=0}
  print(x)

if __name__ == '__main__':
  main()
