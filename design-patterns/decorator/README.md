Decorator
======

The Decorator Pattern attaches additional responsibilities to an object dynamically. Decorators provide a flexible alternative to subclassing for extending functionality.

The java.io package heavily uses the decorator design pattern.

#### Component
Each component can be used on its own, or wrapped by a decorator.
+ Beverage.java

#### ConcreteComponent
The ConcreteComponent is the object we're going to dynamically add new behavior to. It extends Component.
+ DarkRoast.java
+ Decaf.java
+ Espresso.java
+ HouseBlend.java

#### Decorator
Each decorator HAS-A (wraps) a components, which means the decorator has an instance variable that holds a reference to a components. Decorators implement the same interface pr abstract class as the component they are going to decorate.
+ CondimentDecorator.java

#### ConcreteDecorator
The ConcreteDecorator has an instance variable for the thing it decorates (the Component the Decorator wraps). Decorators can extend the state of the component. Decorators can add new methods, however, new behavior is typically added by doing computation before or after an existing method in the component.
+ Mocha.java
+ Soy.java
+ Whip.java
