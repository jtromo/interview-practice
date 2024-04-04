# https://neetcode.io/problems/factory

# Factory Method Pattern
# Implement the Factory Method design pattern.

# The Factory Method is a creational design pattern that provides an interface for creating objects in a superclass but allows subclasses to alter the type of objects that will be created.

# You are given code that includes a few vehicles types and their respective factories. Complete the factory method implementation such that each factory returns the correct vehicle.

# Example:

# VehicleFactory carFactory = new CarFactory();
# VehicleFactory truckFactory = new TruckFactory();
# VehicleFactory bikeFactory = new BikeFactory();

# Vehicle myCar = carFactory.createVehicle();
# Vehicle myTruck = truckFactory.createVehicle();
# Vehicle myBike = bikeFactory.createVehicle();

# myCar.getType();   // "Car"
# myTruck.getType(); // "Truck"
# myBike.getType();  // "Bike"

class Vehicle(ABC):
    @abstractmethod
    def getType(self) -> str:
        pass

class Car(Vehicle):
    def getType(self) -> str:
        return "Car"

class Bike(Vehicle):
    def getType(self) -> str:
        return "Bike"

class Truck(Vehicle):
    def getType(self) -> str:
        return "Truck"

class VehicleFactory(ABC):
    @abstractmethod
    def createVehicle(self) -> Vehicle:
        pass

class CarFactory(VehicleFactory):
    def createVehicle(self) -> Vehicle:
        return Car()

class BikeFactory(VehicleFactory):
    def createVehicle(self) -> Vehicle:
        return Bike()

class TruckFactory(VehicleFactory):
    def createVehicle(self) -> Vehicle:
        return Truck()
