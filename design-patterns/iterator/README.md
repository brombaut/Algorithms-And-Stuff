Iterator
======

The Iterator Pattern provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation. It also places the task of traversal on the iterator object, not on the aggregate, which simplifies the aggregate interface and implementation, and places the responsibility where it should be.

#### Client
+ Waitress.java

#### Aggregate Interface
Having a common interface for your aggregates is handy for your client; it decouples your client from the implementation of your collection of objects.
+ Menu.java

#### ConcreteAggregate
The ConcreteAggregate has a collection of objects and implements the method that returns an iterator for its collection. Each ConcreteAggregate is responsible for instantiating a ConcreteIterator that can iterate over its collection of objects.
+ PancakeHouseMenu.java
+ DinerMenu.java

#### Iterator Interface
The Iterator interface provides the interface that all iterators must implement, and a set of methods for traversing over elements of a collection. Here we're using the java.util.Iterator. If you don't want to use Java's Iterator interface, you can always create your own.
+ java.util.Iterator

#### ConcreteIterator
The ConcreteIterator is responsible for managing the current position of the iteration.
+ DinerMenuIterator.java
+ Note that we're using the ArrayList iterator for PancakeHouseIterator