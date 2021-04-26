# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Discount.destroy_all

employee = Discount.create!(percent: 28, quantity: 5, merchant_id: 1)
flier = Discount.create!(percent: 10, quantity: 10, merchant_id: 1)
tv = Discount.create!(percent: 15, quantity: 3, merchant_id: 1)

promo = Discount.create!(percent: 12, quantity: 10, merchant_id: 2)
single = Discount.create!(percent: 20, quantity: 1, merchant_id: 2)
