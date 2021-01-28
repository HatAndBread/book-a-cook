
puts "Erasing old junk ✨💃"
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

30.times do
  course = Course.new
  course.price = rand(30...100)
  course.description = Faker::Food.description
  course.title = Faker::Food.dish
  course.user = User.all.sample
  file = URI.open('https://source.unsplash.com/featured/?dinner,meal')
  course.photos.attach(io: file, filename: "#{rand(1..100000)}.png", content_type: 'image/png')
  course.save
  puts "Randomly generated course:"
  p course
end

puts "Seed finished🐰 Have a lovely day ❣️🧚‍♀️"