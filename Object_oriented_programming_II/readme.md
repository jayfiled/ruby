# OOP pt II

## Public and private methods (or areas in classes)

> Private = Methods that can't be called by <i>Class.method_name</i> even though they exist in the class.

When you call <code>Object.method</code>, <code>Object</code> is the receiver of the method.

Private methods can only be called from other methods inside the object that they are defined.

In other words, private methods can't be called with an explicit receiver

In order to get the info, we need to create public methods that know how to access info from the private method.

> This separates the <b>private implementation from the public interface</b>

## More refactoring

> attr_reader & attr_writer

replaces methods in classes used for reading or changing variables, i.e:

    class Person 

    initialize(user, job)
    #code here
    end

    def username
    return username
    end

    def job(newJob)
    @job = newJob
    end

    end

Can be changed to:

    class Person 

    initialize(user, job)
    #code here
    end

    attr_reader :user

    attr_writer :job

    def job(newJob)
    @job = newJob
    end

    end

one more example:

    class Person
    def initialize(name, job)
        @name = name
        @job = job
    end
    
    def name
        @name
    end
    
    def job=(new_job)
        @job = new_job
    end
    end

turns to:

class Person
  def initialize(name, job)
    @name = name
    @job = job
  end
  
attr_reader :name
 
attr_writer :job
  
end

> or use <code>attr_accessor</code> to replace a variable that has an <code>attr_reader</code> and <code>attr_writer</code>

class Person
  attr_reader :name
  attr_reader :job
  attr_writer :job
  
  def initialize(name, job)
    @name = name
    @job = job
  end
end

changes to

class Person

    attr_reader :name
    attr_accessor :job

    def initialize(name, job)
        @name = name
        @job = job
    end
end

## Modules

CapitalizedCamelCase, or, Pascal notation

Best Practice to use constants instead of variables. Constant declaration syntax: ALL_CAPS_SEPARATED_BY_UNDERSCORES

> One purpose of modules is to separate methods and constants into named spaces, hence the term; <b>namespacing</b>

So if you have a constant named PI in the Math module, and you've built your own module Circle.PI, you reference them like so:

    Math::PI
    Circle::PI

using the <b>scope resolution operator</b> to avoid confusing Ruby.

Use require to import a module.
- Module name in lowercase and in single quotation marks:

    require 'date'

    puts date.today

Similar to javascript destructuring, you can use:

    includes Math

to be able to reference the constants and methods that are in the Math module <i>without</i> having to type <code>Math::</code> or <code>Math.</code> first

    class Angle
    include Math
    
    attr_accessor :radians
    
    def initialize(radians)
        @radians = radians
    end
    
    def cosine
        cos(@radians)
    end
    end

    acute = Angle.new(1)
    acute.cosine

> the fact that we included a module into a class allows us to to customize a class without rewriting it - called a <b>mixin</b>

    module Action
    def jump
        @distance = rand(4) + 2
        puts "I jumped forward #{@distance} feet!"
    end
    end

    class Rabbit
    include Action
    attr_reader :name
    def initialize(name)
        @name = name
    end
    end

    class Cricket
    include Action
    attr_reader :name
    def initialize(name)
        @name = name
    end
    end

    peter = Rabbit.new("Peter")
    jiminy = Cricket.new("Jiminy")

    peter.jump
    jiminy.jump

See how above we can referece the jump method in the rabbit class because we included the Action module in it?






