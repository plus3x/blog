# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all
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

Post.destroy_all
posts = []
(1_000_000..2_000_000).to_a.sample.times { |e|
  posts << {
    title: ['Apple', 'Books', 'Tables', 'Names'].sample,
    description: ['Good choose', 'Nice name', 'Simple fruit', 'Good for learning'].sample,
    category: Category.all.sample
  }
}
puts "Default posts: "
Post.create(posts).each do |post|
  if post.save
    print "*"
  else
    puts '>>> Post not created!'
  end
end
puts ''