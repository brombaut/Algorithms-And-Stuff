Factory Method
======

The Factory Method Pattern defines an interface for creating an object, but lets subclasses decide which clas to instantiate. Factory method lets a class defer instantiation to subclasses.

```Java
abstract Product factoryMethod(String type)
```