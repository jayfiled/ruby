# New concepts / differences from JavaScript

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
    # @username belongs to the hal instance.

    puts "Manufacturer: #{$manufacturer}"
    # $manufacturer is global! We can get it directly.

    puts "Files: #{Computer.display_files}"
    # @@files belongs to the Computer class.

