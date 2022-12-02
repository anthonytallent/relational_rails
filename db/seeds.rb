# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@stinky_petes = Restaurant.create!(name: "Stinky Pete's", city: "Redlands", star_rating: 1, osha_safety_certified: false)
@nice_smellin_sals = Restaurant.create!(name: "Nice Smellin' Sal's", city: "Redlands", star_rating: 5, osha_safety_certified: true)

@stephanie = @nice_smellin_sals.chefs.create!(name: "Stephanie Cobalt", age: 27, title: "Sous Chef", full_time: true)
@susie = @nice_smellin_sals.chefs.create!(name: "Susie Mae", age: 21, title: "Assistant Sous Chef", full_time: true)
@bellatrix = @nice_smellin_sals.chefs.create!(name: "Bellatrix Le Yum", age: 38, title: "Pastry Chef", full_time: true)
@crusty = @stinky_petes.chefs.create!(name: "Crusty Calvin", age: 104, title: "Sous Chef", full_time: false)
@slimy = @stinky_petes.chefs.create!(name: "Slimy Susan", age: 78, title: "Assistant Sous Chef", full_time: false)
@nasty = @stinky_petes.chefs.create!(name: "Nasty Norman", age: 12, title: "Owner", full_time: true)