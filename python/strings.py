string1 = "First"
print(string1)
string2 = 'Second'
print(string2)


print(f"\n\n== case conversion ==")

lower = "Lower"
print(f"\n- {lower}")
print(lower.lower())

upper = "upper"
print(f"\n- {upper}")
print(upper.upper())

title = "title this is"
print(f"\n- {title}")
print(title.title())

capitalize = "capitalize this is"
print(f"\n- {capitalize}")
print(capitalize.capitalize())


print(f"\n\n== operators ==")

print(f"\n- + -")
print(string1 + string2)
print(string1 + " test " + string2)
print(string1 + " test" + str(1) + " " + string2)

print(f"\n- * -")
print(string1 * 3)
print(string1 * -3) # empty string

print(f"\n- in -")
string1 = "this is a long sentence"
print("is a" in string1)
print("is A" in string1)

print(f"\n- not in -")
string1 = "this is a long sentence"
print("is a" not in string1)
print("is A" not in string1)


print(f"\n\n== built-in functions ==")

print(f"\n- chr() -") # Returns a character value for the given integer.
print(chr(35))

print(f"\n- ord() -") # Returns an integer value for the given character.
print(ord("#"))

print(f"\n- len() -") # length of string
print(len("012345678"))

print(f"\n- str() -") # Returns a string representation of an object.
print(str(7+9))

print(f"\n\n== format ==")

print(f"\n- f -")
print(f"{string1}{string2}")
print(f"{string1} test {string2}")
print(f"{string1} test{str(1)} {string2}")

print(f"\n- arithmetic -")
print(f"20 days are {20 * 24 * 60 * 60} seconds");

print(f"\n- multiline -")
print("One\nTwo\tTab")


print(f"\n\n== List conversions  ==")

print(f"\n- join -")
list1 = ["one", "two", "three"]
print(list1)
print(" ".join(list1));
print(", ".join(list1));

print(f"\n- split -")
split_string = f"one+ two+ three+ four+"
print(split_string);
print(split_string.split());
print(split_string.split("+"));


print(f"\n\n== slice ==")

# x[start: stop: step]
sliceString = "This is a string."

print(f"\n- slice1 -")
sliced1 = sliceString[0:4:1] # This
print(sliced1)

print(f"\n- slice2 -")
sliced2 = sliceString[2:8:2] # i s
print(sliced2)

print(f"\n- reverse list -")
slicedReverse = sliceString[::-1] # .gnirts a si sihT
print(slicedReverse)

print(f"\n- slice3 -")
sliced3 = sliceString[2:] # is is a string.
print(sliced3)

print(f"\n- slice4 -")
sliced4 = sliceString[1:3] # hi
print(sliced4)

print(f"\n- slice5 -")
sliced5 = sliceString[:7:2] # Ti s
print(sliced5)

accessString = "This string"
print(accessString)


print(f"\n\n== indexing ==")

# strings are sequences of chars. Can be accessed by index

s = "this is my string"
print(s)

print(f"\n- positive indexing -")
print(s[0])
print(s[1])
print(s[3])
print(s[len(s)-1]) # last

print(f"\n- negative indexing -") # from back
print(s[-1])
print(s[-3])
print(s[-len(s)]) # first


print(f"\n\n== modifying strings ==")

s = "abc de fg hijk lmnopq"
print(s)

# can't by index. Immutable

print(f"\n- replace -")

new = s.replace("f", "w")
print(new)

print(f"\n- mutliple splice -")
new = s[:5] + " middle " + s[5:]
print(new)


print(f"\n\n== find and replace ==")

s = 'foo bar foo baz foo qux'

print(f"\n- count -")
print(s.count("foo"))
print(s.count("foo", 0, 6))
print(s.count("crazy"))

print(f"\n- endswith -")
print(s.endswith("qux"))
print(s.endswith("foo", 0, 3))
print(s.endswith("foo"))

print(f"\n- find -")
print(s.find("foo"))
print(s.find("foo", 0, 6))
print(s.find("crazy"))

print(f"\n- rfind -") # from end first
print(s.rfind("foo"))
print(s.rfind("foo", 0, 6))
print(s.rfind("crazy"))

print(f"\n- index -") # same as find but raises if not found instead of -1
try:
    print(s.index("foo"))
except Exception as e:
    print(e)
try:
    print(s.index("foo", 0, 6))
except Exception as e:
    print(e)
try:
    print(s.index("crazy"))
except Exception as e:
    print(e)

print(f"\n- rindex -") # from end first
try:
    print(s.rindex("foo"))
except Exception as e:
    print(e)
try:
    print(s.rindex("foo", 0, 6))
except Exception as e:
    print(e)
try:
    print(s.rindex("crazy"))
except Exception as e:
    print(e)

print(f"\n- startswith -")
print(s.startswith("qux"))
print(s.startswith("foo", 0, 3))
print(s.startswith("foo"))


print(f"\n\n== Character Classification ==")

print(f"\n- isalnum -")
x = "abc123"
print(x)
print(x.isalnum())
x = "abc123-"
print(x)
print(x.isalnum())

print(f"\n- isalpha -")
x = "abc"
print(x)
print(x.isalpha())
x = "abc123"
print(x)
print(x.isalpha())

print(f"\n- isdigit -")
x = "123"
print(x)
print(x.isdigit())
x = "abc123"
print(x)
print(x.isdigit())

print(f"\n- isspace -")
x = " 123 "
print(x)
print(x.isspace())
x = "abc123"
print(x)
print(x.isspace())


print(f"\n\n== String Formatting ==")

print(f"\n- strip -")
x = " 123 "
print(x)
print(x.strip()) #lstrip rstrip