def main():
  list1 = [5, 6, 7, 8, 9, 10]
  print(list1)

  list2 = [0, 2, 4, 1, 6, 3]
  print(list2)

  print(f"== map ==")

  print(f"- plus 2 -")
  result = list(map(lambda x: x + 2, list1))
  print(result)

  print(f"- plus 2 -")
  result = list(map(lambda x: x + 2, list1))
  print(result)

  print(f"\n\n== filter ==")

  print(f"- even numbers -")
  def only_even(num):
    if num % 2 == 0:
      return True
    else:
      return False

  filtered = filter(only_even, list2)

if __name__ == '__main__':
  main()
