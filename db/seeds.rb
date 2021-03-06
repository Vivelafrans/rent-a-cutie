# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning the DB"
User.destroy_all

users = []

users << User.create(
    email: 'test@test.com',
    password: '123456789',
    name: Faker::Name.name,
    age: (18..99).to_a.sample,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    street: Faker::Address.street_address,
    postcode: Faker::Address.postcode,
    city: Faker::Address.city
)

50.times do
  user = User.create(
    email: Faker::Internet.email,
    password: '123456789',
    name: Faker::Name.name,
    age: (18..99).to_a.sample,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    street: Faker::Address.street_address,
    postcode: Faker::Address.postcode,
    city: Faker::Address.city
  )
  users << user
  p user
end

puts "Finished creating #{users.count} users"




















