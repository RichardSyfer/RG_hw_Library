require_relative './lib/library'

library = Library.new
library = File.exist?('./db/db.yml') ? library.load_dump : library.first_load

puts "#{library.best_reader} very often takes the books"
puts "The most popular book is '#{library.best_book}'"
puts "#{library.popularity_best_books} people ordered one of the three most popular books"
