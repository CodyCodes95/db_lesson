# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Author.destroy_all

user = User.create(email: 'admin@test.com', password: 'admin123')
user.add_role :admin

editor = User.create(email: 'foo@test.com', password: 'fubar1337')
editor.add_role :editor

jk = Author.create(first_name: "JK", last_name: "Rowling")
clarke = Author.create(first_name: "Arthur", last_name: "Clarke")
asimov = Author.create(first_name: "Isaac", last_name: "Asimov")

jk.books.create(title: "Harry Potter and the Goblet of Fire")
jk.books.create(title: "Harry Potter and the Half-Blood Prince")
clarke.books.create(title: "2001: A Space Odyssey")
clarke.books.create(title: "A Fall of Moondust")
asimov.books.create(title: "Foundation")
asimov.books.create(title: "I, Robot")

puts "Users: #{User.count}"
puts "Roles: #{Role.count}"
puts "Authors: #{Author.count}"
puts "Books: #{Book.count}"

# Book.destroy_all

# Book.create(title: "Harry Potter and the Goblet of Fire", author: "JK Rowling")
# Book.create(title: "2001: A Space Odyssey", author: "Arthur C. Clarke")
# Book.create(title: "Foundation", author: "Isaac Asimov")