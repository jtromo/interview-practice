class Person:
  def __init__(self, fname, lname):
    self.firstname = fname
    self.lastname = lname

  def printname(self):
    print(self.firstname, self.lastname)

#Use the Person class to create an object, and then execute the printname method:

x = Person("John", "Doe")
x.printname()

class Student(Person):
  def __init__(self, fname, lname, year):
    # To keep the inheritance of the parent's __init__() function, add a call to the parent's __init__() function:
    # Person.__init__(self, fname, lname)
    # By using the super() function, you do not have to use the name of the parent element, it will automatically inherit the methods and properties from its parent.
    super().__init__(fname, lname)
    self.graduationyear = year

  def welcome(self):
    print("Welcome", self.firstname, self.lastname, "to the class of", self.graduationyear)
