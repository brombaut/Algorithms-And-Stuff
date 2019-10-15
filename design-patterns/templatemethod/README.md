Template Method
======

The Template Method Pattern defines the skelwton of an algorithm in a method, deferring some steps to subclasses. Template Method lets subclasses redefine certain steps of an algorithm without changing the algorithm's structure

#### AbstractClass
The AbstractClass contains the template method and abstract versions of the operations used in the template method. The template method makes use of the primitiveOperations to implement an algorithm. It is decoupled from the actual implementation of these operations.

#### ConcreteClass
There may be many ConcreteClasses, each implementing the full set of operations required by the template method. The ConcreteClass implements the abstract operations, which are called when the templateMethod() needs them.

#### Hooked Methods
A hook is a method that os declared in the abstract class, but only given an empty or default implementation. This gives subclasses the ability to "hook into" the algorithm at various points, if they wish; a subclass is also free to ignore the hook.