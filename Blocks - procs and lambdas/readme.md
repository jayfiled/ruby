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

You can yield to a proc (because it gets converted to a block) also:

    def greet
        yield
    end

    greeting = Proc.new {puts "Hello!"}

    greet(&greeting)
    # "Hello!"

# I've missed some learning about passing Ruby methods around with a symbol

- [] - [13 ways of looking at a Ruby Symbol ](http://www.randomhacks.net.s3-website-us-east-1.amazonaws.com/2007/01/20/13-ways-of-looking-at-a-ruby-symbol/)
- [] - [Official Docs](https://ruby-doc.org/core-2.5.0/Symbol.html)
- [] - [Nice looking guide](https://www.rubyguides.com/2018/02/ruby-symbols/)

Example: 

    numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    strings_array = numbers_array.collect(&:to_s)

    puts strings_array

    # ==> ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]

## Lambdas
Syntax the same as a proc

    lambda { |param| block }

i.e.

call using the & sign as the prefix

    strings = ["leonardo", "donatello", "raphael", "michaelangelo"]

    symbolize = lambda { |string| string.to_sym }

    symbols = strings.collect(&symbolize)
    print symbols

- Very much the same as procs, but with two main differences.
1. A <b>lambda</b> will check the amount of arguments sent to it, so if the arguments don't match  the parameters, it will throw an error.
In the case of a <b>proc</b>, it will ignore the parameters, if there are not enough arguments, or automatically assign NIL to them if there are too many.

2. <b>Lambda's</b> return, then go back to the method, whereas <b>procs</b> return immediately and ignore everything else in the method.



        def batman_ironman_proc
        victor = Proc.new { return "Batman will win!" }
        victor.call
        "Iron Man will win!"
        end

        puts batman_ironman_proc

        def batman_ironman_lambda
        victor = lambda { return "Batman will win!" }
        victor.call
        "Iron Man will win!"
        end

        puts batman_ironman_lambda

        #prints: 
        Batman will win! <-- from proc
        Iron Man will win! <--- from lambda

? It's not clear if the lambda is called.  If it is, why wasn't 'Batman will win!' printed first??  If not, then whats the point?

another example:

    my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]

    symbol_filter = lambda { |el| el.is_a? Symbol }

    symbols = my_array.select(&symbol_filter)

    puts symbols

## Review:

### Blocks

    odds_n_ends = [:weezard, 42, "Trady Blix", 3, true, 19, 12.345]

    ints = odds_n_ends.select { |d_type|
        d_type.is_a? Integer
    }

    puts ints

### Procs

ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]


    under_100 = Proc.new { |num| num < 100 }

    youngsters = ages.select(&under_100)

    puts youngsters

### Lambdas

    crew = {
    captain: "Picard",
    first_officer: "Riker",
    lt_cdr: "Data",
    lt: "Worf",
    ensign: "Ro",
    counselor: "Troi",
    chief_engineer: "LaForge",
    doctor: "Crusher"
    }

    first_half = lambda { |key, value| value < "M"}

    a_to_m = crew.select(&first_half)

    puts a_to_m

