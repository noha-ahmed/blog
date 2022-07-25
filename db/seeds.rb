# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

post_one = Post.create(author: 'Noha', content: 'Hi Guys! This is my first post.')
c_one = Comment.create(author: 'Yasmine', content: 'Hi Noha!', post_id: 12)
c_two = Comment.create(author: 'Menna', content: 'Hi Noha!', post_id: 11)
c_three = Comment.create(author: 'Mariam', content: 'Hi Noha!', post_id: 11)
c_4 = Comment.create(author: 'Farah', content: 'Hi Noha!', post_id: 11)
c_5 = Comment.create(author: 'Fatema', content: 'Hi Noha!', post_id: 11)
