Abstract Factory
======

The Abstract Factory Pattern provides an interface for creating families of related or dependent objects without specifying their concrete classes.

#### Client
The client is written against the abstract factory and then composed at runtime with an actual factory.
+ PizzaStore.java

#### Abstract Factory
Defines the interface that all concrete factories must implement, which consists of a set of methods for producing products.
+ PizzaIngredientFactory.java

#### Concrete Factory
Implement the different product families. To create a product, the client uses one of these factories, so it never has to instantiate a product object.
+ NYPizzaIngredientFactory.java

#### Abstract Product
The product family. Each concrete factory can produce an entire set of products.
+ Dough.java
+ Sauce.java
+ Cheese.java
+ Clams.java
+ Veggies.java
+ Pepperoni.java

#### Concrete Product
Concrete implementations of the products.
+ ThinCrustDough.java
+ SlicedPepperoni.java
+ ReggianoCheese.java
+ RedPeppers.java
+ Onion.java
+ Mushroom.java
+ MarinaraSauce.java
+ Garlic.java
+ FreshClams.java

