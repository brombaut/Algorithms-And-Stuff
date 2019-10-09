

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
