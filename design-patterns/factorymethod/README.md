Factory Method
======

The Factory Method Pattern defines an interface for creating an object, but lets subclasses decide which clas to instantiate. Factory method lets a class defer instantiation to subclasses.

```Java
abstract Product factoryMethod(String type)
```

#### Product
All products must implement the same interface so that the classes that use the products can refer to the interface, not the concrete class. Factories produce products, and in the PizzaStore, our product is Pizza.
+ Pizza.java

#### Concrete Product
All the pizzas that are produced by the store.
+ NYStyleCheesePizza.java
+ ChicagoStyleCheesePizza.java

#### Creator
The Creator is a class that contains the implementations for all of the methods to manupulate products, except for the factory method. The abstract factpryMethod() is what all Creator subclasses must implement.
+ PizzaStore.java

#### ConcreteCreator
The ConcreteCreator implements the factiryMethod(), which is the method that actually produces products. The ConcreteCreator is responsible for creating one or more concrete products. It is the only class that has the knowledge of how to create these products.
+ NYPizzaStore.java
+ ChicagoPizzaStore.java