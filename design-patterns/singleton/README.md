Singleton
======

The Singleton Pattern ensures a class has only one instannce, and provides a global point of access to it.

#### Singleton
The `getInstance()` method is static, which means it's a class method, so you can conveniently access this method from anywhere in your code using `Singleton.getInstance()`. That's just as easy as accessing a global variable, but we get benefits like lazy initialization from the Singleton. The `uniqueInstance` class variable holds our one and only instance of Singleton. A class implementing the Singleton pattern is more than a Singleton; it is a general purpose class with its own set of data and methods.

### Handling Multithreading Issues

#### SynchronizedSingleton
By adding the synchronized keyword to `getInstance()`, we force every thread to wait its turn before it can enter the method. That is, notwo threads may enter the method at the same time. Keep in mind that synchronizing a method can decrease performance by a factor of 100, so if a high-traffic part of your code begins using `getInstance()`, another option might have to be considered.

#### EagerSingleton
If your application always creates and uses an instance of the Singleton or the overhead of creation and runtime aspects of the Singleton are not onerous, you may want to create your Singleton eagerly.

#### DoubleCheckedLockingSingleton
With double-checked locking, we first check to see if an instance is created, and if not, THEN we synchronize. This way, we only synchronize the first time through. The `volatile` keyword ensure that multiple threads handle the `uniqueInstance` variable correctly when it is being initialized to the Singleton instance