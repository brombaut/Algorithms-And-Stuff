Adapter
======

The Adapter Pattern converts the interface of a class into another interface the clients expect. Adapter lets classes work together that couldn't otherwise because of incompatible interfaces.

#### Client
The client sees only the target interface.
+ DuckTestDrive.java

#### Target
The Adapter implments the Target interface.
+ Duck.java

#### Adapter
Adapter is composed with the Adaptee.
+ TurkeyAdapter.java

#### Adaptee
Allrequests get delegated to the Dapatee.
+ Turkey.java