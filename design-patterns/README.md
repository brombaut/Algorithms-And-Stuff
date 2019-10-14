

# Design Principles

+ ## Encapsulate What Varies
Identify the aspects of your application that vary and separate them from what stays the same. Take what varies and "encapsulate" it so it won't affect the rest of your code. This results in fewer unintended consequences from code changes and more flexibility in the system.

+ ## Program to an Interface, NOT an Implementation

+ ## Favor Composition over Inheritance

+ ## Loose Coupling
Strive for loosely coupled designed between objects that interact. Loosely coupled designes allow us to build flexible OO systems that can handle change because they minimize the interdependency between objects.

+ ## Open-Closed Principle
Class should be open for extension, but closed for modification. The goal is to allow classes to be easily extended to incorporate new behavior without modifying existing code. What do we get if we accomplish this? Designes that are resilient to change and flexible enough to take on new functionality to meet changing requirements. Be careful when choosing the areas of code that need to be extended: applying the Open-Closed Principle everywhere is wasteful and unnecessary, and can lead to complex, hard-to-understand code.

+ ## Dependency Inversion Principle
Depend upon abstractions. Do not depend upon concrete classes. High-level components should not depend on low-level components; rather, they should both depend on abstractions.

+ ## Principle of Least Knownedge
Talk only to your immediate friends. When you are designing a system, be careful of the number of classes it interacts with and also how it comes to interact with those classes. This prevents us from creating designs that have a large number of classes coupled together so that changes in one part of the system cascade to other parts, When you build a lot of dependencoes between many classes, you are building a fragile system that will be costly to maintain and comple for others to understand. The principle provides some guidelines (Law of Demeter): take any object; now from any method in that object, the principle tells us that we should only invoke methods that belong to:
* The object itself
* Objects passed in as a parameter to the method
* Any object the method creates or instantiates
* Any components of the object

+ ## The Hollywood Principle
"Don't call us, we'll call you"
The Hollywood Principle gives us a way to prevent "dependency rot." Dependency rot happens when you have high-level components depending on low-level components depending on high-level components depending on side-ways components depending on low-level components, and so on. When rot sets in, no one can easily understand the way a system is designed. With the Hollywood principle, we allow low-level components to hook themselves into a system, but the high-level components determine when they are needed, and how. In other words, the high-level components give the low-level components a "don't call us, we'll call you" treatment.