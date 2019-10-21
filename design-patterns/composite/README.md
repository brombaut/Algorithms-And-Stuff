Composite
======

The Composite Pattern allows you to compose objects into tree structures to represent part-whole hierarchies. Composite lets clients treat individual objects and compositions of objects uniformly. Using a composite structures, we can apply the same operations over both composites and individual objects. In other words, in most cases, we can ignore the differences between compositions of objects and individual objects.

#### Client
The Client uses the Component interface to manipulate the objects in the composition.

#### Component
The component defines an interface for all objects in the composition: both the composite and the leaf nodes. The Component may implement a default behavior for `add()`, `remove()`, `getChild()` and its operations

#### Leaf
A lead defines the behavior for the elements in the composition. It does this by implementing the operations the Composite supports. A leaf has no children. Note that the lead also inherits methods like `add()`, `remove()` and `getChild()`, which don't necessarily make a lot of sense for a lead node.

### Composite
The Composite's role is to define behavior of the components having children and to store child components. The Composite also implements the Lead-related operations. Noth that some of these may not make sense on a Composite, so in that case an exception might be generated.