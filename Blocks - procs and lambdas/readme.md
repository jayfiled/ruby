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

    yield_name("Joel") { |n| puts "My name is #{n}"}

Don't forget the parameter on the yeild keyword within the method

    def double(num) 
    yield(num)
    end
    
    double(3) { |num| 2 * num }

## Procs

> You can't save a block as a variable, but you can use 'procs' for that.

Like names to code == method

Names to blocks == procs

~ Great for DRY principles ~

> Kind of like arrow functions being used as a callback to a function in JS

Use $ as a prefix when calling it as an argument to convert it into a block

    floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]

    round_down = Proc.new { |i| i.floor }

    ints = floats.collect(&round_down)
    print ints


