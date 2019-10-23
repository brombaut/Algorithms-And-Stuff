State
======

The State Pattern allows an object to alter its behavior when its internal state changes. The object will appear to change its class.

#### Context
The Context is the class that cna have a number of internal states. In our example, the GumballMachine is the Context. Whenever the request() is made on the Context it is delegated to the state to hande.
+ GumballMachine.java

#### State "interface"
The State interface defines a common interface for all concrete states; the states all implement the same interface so they are interchangeable.
State
+ State.java

#### ConcreteStateA
ConcreteStates handle requests from the Context. Each ConcreteState provides its own implementation for a request. In this way, when the Context changes state, its behavior will change as well
+ HasQuarterState.java
+ NoQuarterState.java
+ SoldOutState.java
+ SoldState.java
+ Winner.java


#### ConcreteStateB
Many concrete states are possible