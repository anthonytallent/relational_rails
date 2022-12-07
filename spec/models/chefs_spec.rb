require 'rails_helper'

RSpec.describe 'Chef' do
  it 'can show only the full time chefs' do
    @stinky_petes = Restaurant.create!(name: "Stinky Pete's", city: "Redlands", star_rating: 1, osha_safety_certified: false)
    @nice_smellin_sals = Restaurant.create!(name: "Nice Smellin' Sal's", city: "Redlands", star_rating: 5, osha_safety_certified: true)

    @stephanie = @nice_smellin_sals.chefs.create!(name: "Stephanie Cobalt", age: 27, title: "Sous Chef", full_time: true)
    @susie = @nice_smellin_sals.chefs.create!(name: "Susie Mae", age: 21, title: "Assistant Sous Chef", full_time: true)
    @bellatrix = @nice_smellin_sals.chefs.create!(name: "Bellatrix Le Yum", age: 38, title: "Pastry Chef", full_time: true)
    @crusty = @stinky_petes.chefs.create!(name: "Crusty Calvin", age: 104, title: "Sous Chef", full_time: false)
    @slimy = @stinky_petes.chefs.create!(name: "Slimy Susan", age: 78, title: "Assistant Sous Chef", full_time: false)
    @nasty = @stinky_petes.chefs.create!(name: "Nasty Norman", age: 12, title: "Owner", full_time: true)  
    
    expect(Chef.only_true).to eq([@stephanie, @susie, @bellatrix, @nasty])
  end
end