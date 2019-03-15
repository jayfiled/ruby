# A CMD line program that lists all words in a paragraph and how many times they were used

puts "Please enter a long sentence "
text = gets.chomp

words = text.split(' ')

frequencies = Hash.new(0)

words.each do |word| 
   frequencies[word] += 1
end

frequencies = frequencies.sort_by { |words, count| 
  	count
  }
frequencies.reverse!

frequencies.each do |word, count|
  puts word + ' ' + count.to_s
end