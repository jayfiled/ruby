# New concepts / differences from JavaScript
 

- Variables with multiple words are separated by underscores, I.e. my_array 

- Comparison with no type coercion 

 
## Adding the ! Edits the variable in place.
## Which will return a string in lower case, but not edit the original variable 

  Input = "This is a string" 

  Input.downcase! 


  Input.downcase 




  Gets.chomp 

  Print 

  Puts 

 
## Loops


### use end 


  For 1 in 1...10 

  #do this 

  end 

 

- ...  excludes 10 

 

For I in 1..10 


end 

 

-  .. includes 10 

 

## Loop methods  

 

- {} are interchangeable  with 'do' and 'end' 

 

- Use 'break if' condition end 

  i = 20 

  loop do 

    i -= 1 

    print "#{i}" 

    break if i <= 0 

  end 

 

## Skip over certain steps in the loop 

  i = 20 

  loop do 

    i -= 1 

    next if i % 2 != 0 

    print "#{i}" 

    break if i <= 0 

  end 

 

 

- object.each 

 

  array = [1,2,3,4,5] 

    

  array.each do |x| 

    x += 10 

    print "#{x}" 

  end 

 

 

## .times iterator 

  100.times do  

    print 'Howzaaaaaattt!!!' 

  end 

 

## until 

  j = 1 

  until j == 51 do  # it is exclusive of the limit. This prints out up to 50. 

    print j 

    j += 1 

  end 