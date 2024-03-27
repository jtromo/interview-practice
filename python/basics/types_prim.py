def main():
  # primitives: int, flout, bool, bytes, string

  print("== int==")

  integer1 = 12
  print(integer1)
  interger2 = -6
  print(interger2)

  print(f"\n== float ==")

  float1 = 12.5
  print(float1)
  float2 = -5.5
  print(float2)

  print(f"\n== bool ==")

  bool1 = True
  print(bool1)
  bool2 = False
  print(bool2)

  print(f"\n== bytes ==")

  bytes1 = b"toto\xfe\775"
  print(bytes1)

  print(f"\n== string ==")

  string1 = "First"
  print(string1)
  string2 = 'Second'
  print(string2)

  print("- string basics -")

  print("  multiline")
  print("One\nTwo\tTab")

  lower = "Lower"
  print(f"  {lower}")
  print(lower.lower())

  upper = "upper"
  print(f"  {upper}")
  print(upper.upper())

  title = "title"
  print(f"  {title}")
  print(title.title())

  print("  concat+")
  print(string1 + string2)
  print(string1 + " test " + string2)
  print(string1 + " test" + str(1) + " " + string2)

  print("  concatf{}")
  print(f"{string1}{string2}")
  print(f"{string1} test {string2}")
  print(f"{string1} test{str(1)} {string2}")

  print("  arithmetic")
  print(f"20 days are {20 * 24 * 60 * 60} seconds");

  print("  split")
  split_string = f"one+ two+ three+ four+"
  print(split_string);
  print(split_string.split());
  print(split_string.split("+"));

  print(f"\n== variables ==")

  days_to_seconds = 24 * 60 * 60
  unit_name = "seconds"

  print(f"40 days are {40 * days_to_seconds} {unit_name}")

  print(f"\n== math ==")

  print("  abs() neg to pos")
  print(abs(-146))

  print("  round")
  print(round(123.4567890))

  print("  round to two digits")
  print(round(123.4567890, 2))

  print("  pow 2 to 3rd power")
  print(pow(2, 3))

if __name__ == '__main__':
  main()
