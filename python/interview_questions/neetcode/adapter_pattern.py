# https://neetcode.io/problems/adapter

# Adapter Pattern
# Implement the Adapter design pattern.

# The Adapter is a structural design pattern that allows incompatible interfaces to work together. It wraps an existing class with a new interface so that it becomes compatible with the client's interface.

# You are given completed SquareHole, Square and Circle classes. A Square fits into a SquareHole if the Square's side length is less than or equal to the SquareHole's length. A Circle has a radius and a Circle fits into a SquareHole if the Circle's diameter is less than or equal to the SquareHole's length.

# Complete the implementation of the CircleToSquareAdapter class such that it adapts a Circle to a Square.

# diagram

# Example 1:

# SquareHole squareHole = new SquareHole(5);

# Square square = new Square(5);
# squareHole.canFit(square);            // true

# Circle circle = new Circle(5);
# CircleToSquareAdapter circleAdapter = new CircleToSquareAdapter(circle);
# squareHole.canFit(circleAdapter);     // false
# Example 2:

# SquareHole squareHole = new SquareHole(5);

# Square square = new Square(6);
# squareHole.canFit(square);            // false

# Circle circle = new Circle(2);
# CircleToSquareAdapter circleAdapter = new CircleToSquareAdapter(circle);
# squareHole.canFit(circleAdapter);     // true

class Square:
    def __init__(self, sideLength=0.0):
        self.sideLength = sideLength

    def getSideLength(self) -> float:
        return self.sideLength

class SquareHole:
    def __init__(self, sideLength: float):
        self.sideLength = sideLength

    def canFit(self, square: Square):
        return self.sideLength >= square.getSideLength()

class Circle:
    def __init__(self, radius: float):
        self.radius = radius

    def getRadius(self):
        return self.radius

class CircleToSquareAdapter(Square): # denotes parent (inheritence)
    def __init__(self, circle: Circle):
        self.circle = circle

    def getSideLength(self) -> float:
        return self.circle.radius * 2
