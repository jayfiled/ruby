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

