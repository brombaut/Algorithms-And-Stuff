Simple Factory
======

Simple Factory isn't an actual design pattern, more of a programming idiom that is commonly used.

#### Client
The Client of the Factory. PizzaStore goes through the SimplePizzaFactory to get instances of Pizza.
+ PizzaStore.java

#### SimpleFactory
This is the factory where we create pizzasl it should be the only part of our application that refers to concrete Pizza classes. The create method is often declared statically.
+ SimplePizzaFactory.java

#### Produc
The product of the simple factory. In this example, Pizza is defined as an abstract class with some helpful implementations that can be overridden.
+ Pizza.java

#### ConcreteProduct
Each product needs to implement the Pizza interface (which in this case means "extend the Pizza class") and be concrete. As long as that's the case it can be created by the factory and handed back to the client.
+ CheesePizza.java
+ PepperoniPizza.java
+ VeggiePizza.java