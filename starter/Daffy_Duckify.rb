print "Please type something: "
user_input = gets.chomp
user_input.downcase!

if user_input.include? 's'
  user_input.gsub!(/s/, 'th')
else
  print 'There are no \'s\'s in the string'
end

puts "This is how daffy would say it:  #{user_input}!"