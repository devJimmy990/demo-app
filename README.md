# Advanced Flutter Development - Design Patterns Module

## Common Creational Patterns
### Builder Pattern
You are asked to implement the builder design pattern to the User Class in order to create an object that adds to the constructor the data you only want to provide
  - Title: create User class
  - Description: This class has multiple attributes like {First name, Last name, age, phone } use UserBuilder to set this data, finally, you use the build function to create an instance with the data you want to provide only.

### Factory Pattern
Use the Factory design pattern to create objects without specifying their concrete classes
  - Title: Create Shape abstract class with abstract function its name revealMe()
  - Description: 
    - create three classes that are shapes (Circle, Rectangle, and Square) and implement this class with its way of printing.
    - it's a class that has a function called get shape that waits for the string then switch case will take the string to decide to return which Class with its own print message.

Create a class to use the shape Factory to 
print the specified message for Circle, square, and Rectangle

### Singleton Pattern
Use the singleton design pattern to ensure that only one instance is made of the class 
  - Title: Create a class called Database
  - Description: 
    - create your own object in this class which is the object the user will only use to use the class. 
    - add a function called to create a database to check if the object was instantiated before or not.
    - in this class, you will create 2 instances from Database using create database function then you will check they are equal or not to ensure that you applied the concept in the right way.

==================================================
#### Draft - Builder Pattern
  - `create` user class with properties
  - create `user_builder` to set the user properties
  - create `builder_screen` and create 2 different obj from user then display them

#### Draft - Factory Pattern
  - `create` shape class as sealed class to prevent any inheritance out file with `revealMe()` method
  - `implement` shape class to {`circle`, `square`, `rectangle`} to `override` the method and `set` implementation
  - define `enum` shape_factory_type with available types
  - create `factory` class with method get_shape
  - create `factory_screen` and create 3 different types of shape then display them 

#### Draft - Singleton Pattern
  - `create` singleton class based on `factory-constructor`
  - define `is_first_initialized` property to check if class first creation or created before
  - create `singleton_screen` and create 2 obj of singleton class then display them 

  