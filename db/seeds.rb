require 'faker'
require 'open-uri'

if Rails.env.development?
  puts "Clearing development database..."
  puts "Destroying all bookings..."
  Booking.destroy_all
  puts "Destroying all lives..."
  Life.destroy_all
  puts "Destroying all users..."
  User.destroy_all
  puts "Database is cleared"
  puts "-------------------------------"
end
  puts "Generating new database"

# USER 1
user = User.create!(
  name: "DJ Trext",
  email: "dj_trext@lewagon.com",
  password: "password"
)
file = URI.open('https://cdn.digitaldjtips.com/app/uploads/2011/03/28005614/DJ-topview.jpg')
user.avatar.attach(io: file, filename: 'dj.png', content_type: 'image/png')

life = Life.new(
  title: "Hot Melbourne DJ",
  bio: "Meaningful commits only. I play some of the biggest venues in Melbourne, why not live my crazy life for the weekend. Parties all weekend at Melbourne's best spots, closing it out with the 11am set at Breakfast Club",
  price: 500
)

file = URI.open('https://i.guim.co.uk/img/media/1df8234c78c43521916a50a659327ecf032da18c/0_182_5472_3283/master/5472.jpg?width=700&quality=85&auto=format&fit=max&s=21c0869d9893fb54de7d07ee045460ef')
life.photos.attach(io: file, filename: 'rave.png', content_type: 'image/png')

life.user = user
life.save!

# USER 2

user = User.create!(
  name: "Dua Lipa",
  email: "dua_lipa@lewagon.com",
  password: "password"
)

file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/DuaLipaO2020522_%28101_of_110%29_%2852052470251%29_%28cropped%29.jpg/220px-DuaLipaO2020522_%28101_of_110%29_%2852052470251%29_%28cropped%29.jpg')
user.avatar.attach(io: file, filename: 'dua.png', content_type: 'image/png')

life = Life.new(
  title: "Popstar Lyf",
  bio: "If you wanna run away with me, I know a galaxy and I can take you for a ride!",
  price: 1200
)
file = URI.open('https://s31242.pcdn.co/wp-content/uploads/2019/06/GettyImages-911238244-1024x710.jpg')
life.photos.attach(io: file, filename: 'live.png', content_type: 'image/png')

life.user = user
life.save!

# USER 3
user = User.create!(
  name: "Liam Baker",
  email: "liam_baker@lewagon.com",
  password: "password"
)

file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Liam_Baker_2018.1.jpg/220px-Liam_Baker_2018.1.jpg')
user.avatar.attach(io: file, filename: 'liam.png', content_type: 'image/png')

life = Life.new(
  title: "Go Tigez!",
  bio: "I really can't be stuffed playing West Coast this weekend, and considering how crap they are I won't be missed. Live the footy Player's dream and bag a few for the mighty Tiges.",
  price: 800
)

file = URI.open('https://media.timeout.com/images/105536711/750/422/image.jpg')
life.photos.attach(io: file, filename: 'afl.png', content_type: 'image/png')

life.user = user
life.save!

# 5.times do
#   user = User.create!(
#     name: Faker::Name.name,
#     email: Faker::Internet.unique.email,
#     password: "password"
#   )
#   puts "User #{user.id}: #{user.name} added to database"
#   (1..3).to_a.sample.times do
#     life = Life.new(
#       title: "#{Faker::Name.name} the #{Faker::Job.title}",
#       bio: Faker::Lorem.paragraph(sentence_count: (2..5).to_a.sample),
#       price: (25..2000).to_a.sample
#     )
#     life.rating = (1..4).to_a.sample
#     life.user = user
#     life.save!
#     puts "Added #{user.name}'s life/lives"
#   end
# end

# 5.times do
#   start_date = Faker::Date.between(from: 2.days.from_now, to: 28.days.from_now)
#   end_date = start_date + 3.days
#   booking = Booking.new(
#     start_date: start_date,
#     end_date: end_date,
#     status: ["Pending", "Confirmed", "Declined", "Completed"].sample
#   )
#   booking.user = User.all.sample
#   booking.life = Life.all.sample
#   booking.save!
# end

puts "Authenticating Admin..."
User.create!(
  name: 'admin',
  email: 'admin@admin.com',
  password: "admin1"
)

puts "Welcome Cap'n!"
