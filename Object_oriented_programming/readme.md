# OOP pt I

## Classes

Starts with a method called initialize that 'boots up' each object that the class creates.

Use @ before a variable in the class to tell ruby that it is an <i>instance</i> variable
> It means that the variable is attached to the <i>instance</i> of the class

    class Person
    def initialize(name)
    @name = name
    end

    end

    matz = Person.new("Yukihiro")

Variables prefixed with $ @ or @@ are variables that are scoped to:

- Globally -$ - (can access from anywhere)
- The instance - @ - (need to create an instance of a class and access it through there )
- The class - @@ - (need to acces it through the class)

    class Computer
    $manufacturer = "Mango Computer, Inc."
    @@files = {hello: "Hello, world!"}
    
    def initialize(username, password)
        @username = username
        @password = password
    end
    
    def current_user
        @username
    end
    
    def self.display_files
        @@files
    end
    end

    # Make a new Computer instance:
    hal = Computer.new("Dave", 12345)

    puts "Current user: #{hal.current_user}"
    ### @username belongs to the hal instance.

    puts "Manufacturer: #{$manufacturer}"
    ### $manufacturer is global! We can get it directly.

    puts "Files: #{Computer.display_files}"
    ### @@files belongs to the Computer class.

You can use class variables to keep track of how many instances of the object has been created. Like so:

    class Person
    @@people_count = 0
    
    def initialize(name)
        @name = name
        @@people_count += 1
    end
    
    def self.number_of_instances
        return @@people_count
    end
    end

    matz = Person.new("Yukihiro")
    dhh = Person.new("David")

    puts "Number of Person instances: #{Person.number_of_instances}"


# Inheritance

An example of using inheritance with classes

    class ApplicationError
    def display_error
        puts "Error! Error!"
    end
    end

    class SuperBadError < ApplicationError
    end

    err = SuperBadError.new
    err.display_error

Syntax to inherit from a class:

    class DerivedClass < BaseClass
        #some stuff
    end

## Overrides

If you are inheriting a class and you want to override a function, you can define the same 
fuction and it will be overridden.

    class Creature
    def initialize(name)
        @name = name
    end
    
    def fight
        return "Punch to the chops!"
    end
    end

    class Dragon < Creature
    def fight
        return "Breathes fire!"
    end
    end

## Super

When you realise you've overwritten a method of the superclass in your derived class, you can still access the
original method of the superclass, by using the <i>super</i> keyword

    class DerivedClass < Base
    def some_method
        super(optional args)
        # Some stuff
        end
    end
    end

or like this:

    class Creature
    def initialize(name)
        @name = name
    end
    
    def fight
        return "Punch to the chops!"
    end
    end

    # Add your code below!

    class Dragon < Creature
    def fight
        puts "Instead of breathing fire. . . "
        super
    end
    end

?? I'm not sure why there isn't three ends on the above...
> It could be that calling super without any arguments, or any code we don't need to write an express <i>end</i> keyword

You can shorten an expression to one line by using a semicolon, i.e.

    def method; end

Review:

Create a message class, then an email class that uses the parent class's initialize method;

    class Message
    
    @@messages_sent = 0

    def initialize(from, to)
        @from = from
    @to = to
    @@messages_sent += 1
    end

    end

    my_message = Message.new("Mr. Hitchcock", "Mrs Blanka")

    class Email < Message
        def initialize(from, to)
        super
    end
    end

