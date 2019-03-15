movies = {
  Inception: 4 
  }

puts "What would you like to do?"
puts "Type add to add a new movie"
puts "Type update to update the rating of a movie"
puts "Type display to display all movies in the list"
puts "Type delete to delete a movie"
choice = gets.chomp


case choice
 when 'add'
  puts "What's the name of the title?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Whats your rating for #{title}"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} with a rating of #{rating} was added!"
  else
    puts "The movie already exists"
  end
  
 when 'update'
  puts "Which movie do you want to update?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "This movie doesn't exist in the list!"
  else
    puts "Whats's the new rating?"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title}'s rating updated to #{rating}"
  end
  
 when 'display'
  movies.each { |movie, rating|
    puts "#{movie}: #{rating}"}
 when 'delete'
  puts "What title would you like to delete?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "That movie isn't in this list"
  else
    movies.delete(title)
    puts "#{title} deleted"
  end
else
  puts "Error!"
end