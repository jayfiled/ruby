# New concepts / differences from JavaScript

## Simpler if

Instead of:

    if condition
        # Do something!
    end

Do this

    expression if boolean

i.e.

    puts "It's true!" if true

> No need for 'end'

Same goes for unless:

    puts "Some string" unless true == false

Ruby does ternary expressions as well

    puts 3 < 4 ? "3 is less than 4!" : "3 is not less than 4."

Case Statements can be simplified:

    case language
        when "JS" then puts "Websites!"
        when "Python" then puts "Science!" 
        when "Ruby" then puts "Web apps!" 
        else puts "I don't know!" 
    end

conditional assignment operator: 

    ||=

Example:
        favorite_book = nil
    puts favorite_book

    favorite_book ||= "Cat's Cradle"
    puts favorite_book

    favorite_book ||= "Why's (Poignant) Guide to Ruby"
    puts favorite_book

    favorite_book = "Why's (Poignant) Guide to Ruby"
    puts favorite_book

No need for return

Ruby by default will return the last evaluated expression, i.e.

    def multiple_of_3(n)
        n % 3 = 0 ? true : false

Short circuit evaluation

Ruby won't evaluate both expressions if it doesn't have to, i.e.

Ruby will only evaluate up to the || when:

    true_or_false = true || false

Because it knows that anything after the || will result in a true.

Proof:

    def a
    puts "A was evaluated!"
    return true
    end

    def b
    puts "B was also evaluated!"
    return true
    end

    puts a || b
    puts "------"
    puts a && b

    =start Outputs:
        A was evaluated!
        true
        ------
        A was evaluated!
        B was also evaluated!
        true
    =end


.upto & .downto

    "L".upto("P") { |letter| puts letter }

    95.upto(100) { |num| print num, " " }

.respond_to?
## checks to see if you can use a method on a particular object or convert an object into another object

    [1, 2, 3].respond_to?(:push) # True

    [1, 2, 3].respond_to?(:to_sym) # False
