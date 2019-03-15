#first ruby program

print "What's your first name? "

first_name = gets.chomp

#As we aren't using the method capitalize on the assignment, when we do it 
# seperately we need to put an exclamation mark on it to directly adit the
# variable
first_name.capitalize!

print "What's your last name? "

last_name = gets.chomp

last_name.capitalize!

print "What city are you from? "

city = gets.chomp
city.capitalize!

print "What state/province are you from? Please use abbreviated state name "

state = gets.chomp

state.upcase!

# String interpolation in Ruby

print "Your name is #{first_name} #{last_name} and you are from #{city}, #{state}!"