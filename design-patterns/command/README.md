Command
======

The Command pattern encapsulates a request as an object, thereby letting you parameterize other objects with different requests, queue or log requests, and support undoable operations.

#### Client
The Client is responsible for creating a ConcreteCommand and setting its Reciever.
+ RemoteLoader.java

#### Invoker
The Invoker holds a command and at some point asks the command to cartry out a request by calling its `execute()` method.
+ RemoteControll.java

#### Command
Command declares an interface for all commands. A command is invoked through its `execute()` method, which asks a receiver to perform an action. It can also perform `undo()` actions.
+ Command.java

#### ConcreteCommand
The ConcreteCommand defines a binding between an action and a Receiver. The Invoker makes a request by calling `execute()` and the ConcreteCommand carroes ot out by calling one or more actions in the Receiver.
+ CeilingFanHighCommand.java
+ CeilingFanMediumCommand.java
+ CeilingFanOffCommand.java
+ GarageDoorUpCommand.java
+ GarageDoorDownCommand.java
+ LightOnCommand.java
+ LightOffCommand.java
+ MacroCommand.java
+ NoCommand.java (Null Object Design Pattern)
+ StereoOffCommand.java
+ StereoOnWithCDCommand.java

#### Receiver
The Receiver knows how to perform the work needed to carry out the request. Any class can act as a Receiver.
+ CeilingFan.java
+ GarageDoor.java
+ Light.java
+ Stereo.java