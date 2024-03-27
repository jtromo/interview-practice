def main():

  x = [6, 7, 2, 3, 4]

  x.reverse()
  print(x)

  for index, value in enumerate(x):
    print(index, value)



  number = 20

  # match number:
  #   case 0:
  #     print("zero")
  #   case 1:
  #     print("one")
  #   case _:
  #     print("not match")



  result = map(lambda x: x * 2, x)
  print(result)

if __name__ == '__main__':
  main()
