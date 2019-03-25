# OOP pt II

## Public and private methods (or areas in classes)

> Private = Methods that can't be called by <i>Class.method_name</i> even though they exist in the class.

When you call <code>Object.method</code>, <code>Object</code> is the receiver of the method.

Private methods can only be called from other methods inside the object that they are defined.

In other words, private methods can't be called with an explicit receiver

In order to get the info, we need to create public methods that know how to access info from the private method.

> This separates the <b>private implementation from the public interface</b>



