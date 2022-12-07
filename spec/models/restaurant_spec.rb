require 'rails_helper'

RSpec.describe 'restaurant model' do
  before :each do 
    @stinky_petes = Restaurant.create!(name: "Stinky Pete's", city: "Redlands", star_rating: 1, osha_safety_certified: false)
    @nice_smellin_sals = Restaurant.create!(name: "Nice Smellin' Sal's", city: "Redlands", star_rating: 5, osha_safety_certified: true)

    @stephanie = @nice_smellin_sals.chefs.create!(name: "Stephanie Cobalt", age: 27, title: "Sous Chef", full_time: true)
    @susie = @nice_smellin_sals.chefs.create!(name: "Susie Mae", age: 21, title: "Assistant Sous Chef", full_time: true)
    @bellatrix = @nice_smellin_sals.chefs.create!(name: "Bellatrix Le Yum", age: 38, title: "Pastry Chef", full_time: true)
    @crusty = @stinky_petes.chefs.create!(name: "Crusty Calvin", age: 104, title: "Sous Chef", full_time: false)
    @slimy = @stinky_petes.chefs.create!(name: "Slimy Susan", age: 78, title: "Assistant Sous Chef", full_time: false)
    @nasty = @stinky_petes.chefs.create!(name: "Nasty Norman", age: 12, title: "Owner", full_time: true)  
  end

  it 'will count the chefs associated with the restaurant' do
    expect(@nice_smellin_sals.chefs_count).to eq(3)
    expect(@stinky_petes.chefs_count).to eq(3)
  end
  describe '#alphabetical'
    it 'will sort the chefs alphabetically' do
      expect(@nice_smellin_sals.alphabetical).to eq([@bellatrix, @stephanie, @susie])
    end

    it 'will filter chefs by ages over x' do
      expect(@nice_smellin_sals.chefs_greater_than(21)).to eq([@stephanie, @bellatrix])
    end

end