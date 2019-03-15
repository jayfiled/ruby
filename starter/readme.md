# New concepts / differences from JavaScript

## Modify the original variable in place

    print "write something in lowercase!" 
    answer = gets.chomp 
    answer2 = answer.capitalize  
    answer.capitalize! 

 

    First we introduce one new method, capitalize, here. It capitalizes the first letter of a string and makes the rest of the letters lower case. We assign the result to answer2 

    The next line might look a little strange, we don't assign the result of capitalize to a variable. Instead you might notice the ! at the end of capitalize. This modifies the value contained within the variable answer itself. The next time you use the variable answer you will get the results of answer.capitalize  