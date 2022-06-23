require 'faker'

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

5.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password"
  )
  puts "User #{user.id}: #{user.name} added to database"
  (1..3).to_a.sample.times do
    life = Life.new(
      title: "#{Faker::Name.name} the #{Faker::Job.title}",
      bio: Faker::Lorem.paragraph(sentence_count: (2..5).to_a.sample),
      price: (25..2000).to_a.sample
    )
    life.rating = (1..4).to_a.sample
    life.user = user
    life.save!
    puts "Added #{user.name}'s life/lives"
  end
end

5.times do
  start_date = Faker::Date.between(from: 2.days.from_now, to: 28.days.from_now)
  end_date = start_date + 3.days
  booking = Booking.new(
    start_date: start_date,
    end_date: end_date,
    status: ["Pending", "Confirmed", "Declined", "Completed"].sample
  )
  booking.user = User.all.sample
  booking.life = Life.all.sample
  booking.save!
end
