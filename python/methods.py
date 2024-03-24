class person(object):
    population = 50

    def __init__(self, name, age):
        self.name = name
        self.age = age
    
    # A class method receives the class as an implicit first argument, just like an instance method receives the instance 
    # Called on class and doesn't need object.
    # A class method is a method that is bound to the class and not the object of the class.
    # They have the access to the state of the class as it takes a class parameter that points to the class and not the object instance.
    # It can modify a class state that would apply across all the instances of the class. For example, it can modify a class variable that will be applicable to all the instances.
    @classmethod # @classmethod is required
    def getPopulation(cls): # pass in class (need at least one param) since class is auto passed in
        return cls.population

    # Does not receive self or class
    # A static method is also a method that is bound to the class and not the object of the class.
    # This method can’t access or modify the class state.
    @staticmethod
    def isAdult(age):
        return age >= 18

    # Instance method receives the instance as first argument
    def display(self): # pass in instance
        print(self.name, "is", self.age, "years old")
        print(f"{self.name} is {self.age} years old")

newPerson = person("tim", 18)

newPerson.display()

print(person.getPopulation())

print(person.isAdult(33))