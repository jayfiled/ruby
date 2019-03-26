class Account
    attr_reader :name, :balance
    def initialize(name, balance=100)
      @name = name
      @balance = balance
    end
    
    def display_balance(pin_number)
      pin_number == pin ? "Balance: $#{@balance}." : pin_error
    end
    
    def withdraw(pin_number, amount)
      if pin_number == pin
        @balance -= amount
        puts "Withdrew #{amount}. New balance: $#{@balance}."
      else
        pin_error
      end
    end
    
    private
    
    def pin
      @pin = 1234
    end
    
    def pin_error
      "Access denied: incorrect PIN."
    end
    
  end