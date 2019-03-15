puts "Please enter a relatively long sentence: "
txt = gets.chomp()
puts "Which word would you like to redact?"
redact = gets.chomp()

words = txt.split(' ')

words.each do |word|
 if word == redact
   print "REDACTED "
else
   print "#{word} "
end
end

#Don't forget the .each loop needs to have an end
# also the if block.