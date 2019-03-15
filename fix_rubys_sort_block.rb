# .sort! in ruby defaults to sorting elements in ascending order
# the below method can be called with true as a second argument to sort
# in descending order, else it will sort by ascending.

def alphabetize(arr, rev="false")
    arr.sort!
    if rev == true
      arr.reverse!
    else
      return arr
    end
  end
  
  numbers = [1, 3, 1, 2, 8, 10, 100, 99]
  
  puts alphabetize(numbers, true)