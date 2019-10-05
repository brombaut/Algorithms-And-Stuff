Abstract Factory
======

The Abstract Factory Pattern provides an interface for creating families of related or dependent objects without specifying their concrete classes.

#### Client
The client is written against the abstract factory and then composed at runtime with an actual factory.
+ Pizza Store

#### Abstract Factory
Defines the interface that all concrete factories must implement, which consists of a set of methods for producing products.
+ PizzaIngredientFactory

#### Concrete Factory
Implement the different product families. To create a product, the client uses one of these factories, so it never has to instantiate a product object.
+ NYPizzaIngredientFactory

#### Abstract Product
The product family. Each concrete factory can produce an entire set of products.
+ Dough
+ Sauce
+ Cheese
+ Clams
+ Veggies
+ Pepperoni

#### Concrete Product
+ ThinCrustDough
+ SlicedPepperoni
+ ReggianoCheese
+ RedPeppers
+ Onion
+ Mushroom
+ MarinaraSauce
+ Garlic
+ FreshClams

