# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.destroy_all


require 'faker'

category = ["chinese", "italian", "japanese", "french", "belgian"].sample
rating = (0..5).to_a.sample

10.times do
  restaurant = Restaurant.new(
    name: Faker::TheThickOfIt.department,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: category)
  restaurant.save!
end

restaurant_id_array = Restaurant.all.map { |restaurant| restaurant.id }

100.times do
  review = Review.new(
    restaurant_id: restaurant_id_array.sample,
    rating: rating,
    content: Faker::Lorem.paragraph)
  review.save!
end
