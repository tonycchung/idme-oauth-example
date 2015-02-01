# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |x|
  price = x + 10.99
  name = Faker::Commerce.product_name
  price = Faker::Commerce.price
  Product.create(name: name, price: price)
end
