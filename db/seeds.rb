# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all if Rails.env.development?

CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]

5.times do
  r = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: CATEGORY.sample,
    phone_number: Faker::PhoneNumber.phone_number)

  rand(1...4).times do
    Review.create!(
      content: Faker::TvShows::GameOfThrones.quote,
      rating: rand(0...5),
      restaurant: r)
  end
end
