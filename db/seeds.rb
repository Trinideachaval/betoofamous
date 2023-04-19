# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Review.destroy_all
puts "Destroy all reviews"

Reservation.destroy_all
puts "Destroy all reservations"

Celebrity.destroy_all
puts "Destroy all celebrities"

User.destroy_all
puts "Destroy all users"

# Create user Be Famous Too
bft = User.create(
  email: 'bft@email.com',
  first_name: 'Team',
  last_name: 'BeFamousToo',
  password: '123456'
)
puts "Create user: Team BeFamousToo / password: 123456"

# Create 10 random users 
10.times do
  user = User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: '654321'
  )
end
puts "Create 10 faker users"

# Create celebirities 
# Michael Jackson
michael = Celebrity.new(
  user: bft,
  first_name: 'Michael',
  last_name: 'Jackson',
  address: 'Barcelona, España',
  description: 'Great singer from the `80s. Brought to you by our exclusive patented ResurrectTech.',
  )
photo = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Michael_Jackson_in_1988.jpg/220px-Michael_Jackson_in_1988.jpg')
michael.photo.attach(io: photo, filename: '220px-Michael_Jackson_in_1988.jpg', content_type: 'image/jpg')
michael.save(validate: false)  
puts "Create Celebrity - Michael"

statux = ['confirmed', 'pending']
10.times do
  reservation = Reservation.new(
    reserve_begin: '20.06.2020',
    reserve_end: '20.07.2020',
    status: statux.sample,
     user_id: User.all.sample.id,
      celebrity_id: Celebrity.all.sample.id
  )
  reservation.save(validate: false)
end
puts "Create 10 faker reservations"

10.times do
  review = Review.new(
    content: Faker::ChuckNorris.fact,
    rating: rand(0..50) / 10.0,
    reservation_id: Reservation.all.sample.id
  )
  review.save(validate: false)
end
puts "Create 10 faker reviews"

puts "Seeds ok 100%"
