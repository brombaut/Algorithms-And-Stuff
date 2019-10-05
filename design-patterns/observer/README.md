Observer
======

The Oberver Pattern defines a one-to-many dependency between objects so that when one object changes state, all of its dependets are notified and updated automatically.

#### Subject
Objects use this interface to register as observers and also to remove themselves from being observers. Each Subject can have many observers.

#### Concrete Subject
A concrete subject always implements the Subject interface. In addition to the register and remove methods, the concrete subject implements a notifyObservers() method that is used to updateall the current observers whenever state changes. The concrete subject may also have mthods for setting and getting its state.

#### Observer
All potential  observers need to implement the Observer interface. This interface just has one method, update(), that gets called when the Subject's state changes.

#### ConcreteObserver
Concrete observers can be any class that implements the Observer interface. Each observer registers with a concrete subject to recieve updates.