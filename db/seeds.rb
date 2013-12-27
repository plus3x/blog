# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
categories = [
  {name: 'Apples'},
  {name: 'Books'},
  {name: 'Tables'},
  {name: 'Names'}
]
puts "Default categories: "
Category.create(categories).each do |category|
  if category.save
    puts "#{category.id} - #{category.name}"
  else
    puts '>>> Category not created!'
  end
end

Author.delete_all
author_names = ['Garry', 'Harry', 'Barry', 'Marry', 'Dilly', 'Billy', 'Molly']
authors = []
author_names.each { |author_name| authors << {name: author_name, ip: "#{rand(255)}.#{rand(255)}.#{rand(255)}.#{rand(255)}"} }
puts "Default authors: "
Author.create(authors).each do |author|
  if author.save
    puts "#{author.id} - #{author.name} - #{author.ip}"
  else
    puts '>>> Author not created!'
  end
end

Post.delete_all
puts "Default posts: "
rand(1_000..2_000).times do
  post = Post.create({
          title: ['Apple', 'Books', 'Tables', 'Names'].sample,
          description: ['Good choose', 'Nice name', 'Simple fruit', 'Good for learning'].sample,
          category: Category.all.sample,
          author: Author.all.sample,
          created_at: rand(1.year.ago..Time.now) })
  puts '>>> Post not created!' unless post.save
end
puts "#{Post.count} posts created!"

Comment.delete_all
puts "Default comments: "
rand(2_000..4_000).times do
  comment = Comment.create({
                post: Post.all.sample,
                description: ('a'..'z').to_a.shuffle.first(rand(40..100)).join,
                rating: rand(1..5),
                author: Author.all.sample,
                created_at: rand(1.year.ago..Time.now) })
  puts '>>> Comment not created!' unless comment.save
end
puts "#{Comment.count} comments created!"
