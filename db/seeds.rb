
puts "Erasing old junk... ✨💃"
User.destroy_all
10.times do
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.email = Faker::Internet.email
  user.password = Faker::Internet.password
  user.save
  puts "Randomly generated user:"
  p user
end
# a
10.times do
  course = Course.new
  course.price = rand(30...100)
  course.description = Faker::Food.description
  course.title = Faker::Food.dish
  course.user = User.all.sample
  first_word = course.title.split(' ')[0]
  file = URI.open("https://source.unsplash.com/featured/?#{first_word},cooking")
  file_two = URI.open("https://source.unsplash.com/featured/?#{first_word},meal")
  file_three = URI.open("https://source.unsplash.com/featured/?#{first_word},delicious")
  course.photos.attach(io: file, filename: "#{rand(1..1000000)}.png", content_type: 'image/png')
  course.photos.attach(io: file_two, filename: "#{rand(1..1000000)}.png", content_type: 'image/png')
  course.photos.attach(io: file_three, filename: "#{rand(1..1000000)}.png", content_type: 'image/png')
  course.ingredient_list = [Course::INGREDIENTS.sample]
  course.category_list = [Course::CATEGORIES.sample]
  course.save
  puts "Randomly generated course:"
  p course
end

puts "Seed finished🐰 Have a lovely day ❣️🧚‍♀️"