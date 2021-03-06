# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Review.destroy_all
Reservation.destroy_all
Celebrity.destroy_all
User.destroy_all

bft = User.new(
  email: 'bft@email.com',
  first_name: 'Team',
  last_name: 'BeFamousToo',
  password: '123456'
)

10.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  user.save(validate: false)
end

10.times do
  celebrity = Celebrity.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.city, #city no existe en la base de datos
    description: Faker::Demographic.race,
    user_id: User.all.sample.id)
 
  photo = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Michael_Jackson_in_1988.jpg/220px-Michael_Jackson_in_1988.jpg')
  Celebrity.last.photo.attach(io: photo, filename: '220px-Michael_Jackson_in_1988.jpg', content_type: 'image/jpg')
  
  celebrity.save(validate: false)
end

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

10.times do
  review = Review.new(
    content: Faker::ChuckNorris.fact,
    rating: rand(0..50) / 10.0,
    reservation_id: Reservation.all.sample.id
  )
  review.save(validate: false)
end
