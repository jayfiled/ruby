=begin

Return the number (count) of vowels in the given string.

We will consider a, e, i, o, and u as vowels for this Kata.

The input string will only consist of lower case letters and/or spaces.

=end

def getCount(inputStr)

# make a counter

counter = 0

# Make a list of vowels
  vowels = ["a","e","i","o","u"]
  
# on each letter of the input string, check every letter in the list of vowels.
# if the letter in the string matches ANY of the letters in the list, increment counter by 1  

vowels.each do |letter|
  inputStr.include?(letter) ? counter += 1 : counter += 0
end

return counter
    
end

# tests

# Test.assert_equals(getCount("abracadabra"), 5)