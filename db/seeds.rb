# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
Reservation.destroy_all
Celebrity.destroy_all
User.destroy_all


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
    city: Faker::Address.city,
    description: Faker::Demographic.race,
    photo_url: 'https://picsum.photos/200/300',
    user_id: User.all.sample.id
  )
  celebrity.save(validate: false)
end





statux = ['confirmed', "cancelled", 'pending', 'reject' ]
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


