
puts "Erasing old junk... ✨💃"
User.destroy_all
10.times do
  file = URI.open("https://source.unsplash.com/featured/?person,face")
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.email = Faker::Internet.email
  user.password = Faker::Internet.password
  user.photo.attach(io: file, filename: "#{rand(1..1000000)}.png", content_type: 'image/png')
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
  file = URI.open("https://source.unsplash.com/featured/?delicious,cooking")
  file_two = URI.open("https://source.unsplash.com/featured/?delicious,meal")
  file_three = URI.open("https://source.unsplash.com/featured/?food,delicious")
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