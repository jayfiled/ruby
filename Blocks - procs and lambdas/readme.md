# New concepts / differences from JavaScript

> Similar to array.map() in JS

array.collect {}

Except that you can modify the original array by adding an ! to .collect

    my_nums = [1, 2, 3]
    my_nums.collect! { |num| num ** 2 }

Yield
Why do some methods accept a block and others don’t? It’s because methods that accept blocks have a way of transferring control from the calling method to the block and back again. We can build this into the methods we define by using the yield keyword.

    def block_test
        puts "We're in the method!"
        puts "Yielding to the block..."
        yield
        puts "We're back in the method!"
    end

    block_test { puts ">>> We're in the block!" }

yield takes parameters 

    def yield_name(name)
        puts "In the method! Let's yield."
        yield("Kim")
        puts "In between the yields!"
        yield(name)
        puts "Block complete! Back in the method."
    end

    yield_name("Eric") { |n| puts "My name is #{n}." }

    # Now call the method with your name!

    yield_name("Joel") { |n| puts "My name is #{n}"}