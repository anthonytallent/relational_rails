require 'rails_helper'

RSpec.describe 'the restaurants show page' do
  before :each do 
    @stinky_petes = Restaurant.create!(name: "Stinky Pete's", city: "Redlands", star_rating: 1, osha_safety_certified: false)
    @nice_smellin_sals = Restaurant.create!(name: "Nice Smellin' Sal's", city: "Los Angeles", star_rating: 5, osha_safety_certified: true)

    @stephanie = @nice_smellin_sals.chefs.create!(name: "Stephanie Cobalt", age: 27, title: "Sous Chef", full_time: true)
    @susie = @nice_smellin_sals.chefs.create!(name: "Susie Mae", age: 21, title: "Assistant Sous Chef", full_time: true)
    @bellatrix = @nice_smellin_sals.chefs.create!(name: "Bellatrix Le Yum", age: 38, title: "Pastry Chef", full_time: true)
    @crusty = @stinky_petes.chefs.create!(name: "Crusty Calvin", age: 104, title: "Sous Chef", full_time: false)
    @slimy = @stinky_petes.chefs.create!(name: "Slimy Susan", age: 78, title: "Assistant Sous Chef", full_time: false)
    @nasty = @stinky_petes.chefs.create!(name: "Nasty Norman", age: 12, title: "Owner", full_time: true)
  end
  it 'displays the name of the restaurants' do
    visit "/restaurants/#{@stinky_petes.id}"

    expect(page).to have_content(@stinky_petes.name)
    expect(page).to_not have_content(@nice_smellin_sals.name)

  end

  it 'displays the name of the restaurants' do
    visit "/restaurants/#{@stinky_petes.id}"

    expect(page).to have_content("City: #{@stinky_petes.city}")
    expect(page).to_not have_content("City: #{@nice_smellin_sals.city}")

  end

  it 'displays the star_rating of the restaurants' do
    visit "/restaurants/#{@stinky_petes.id}"

    expect(page).to have_content("Stars: #{@stinky_petes.star_rating}")
    expect(page).to_not have_content("Stars: #{@nice_smellin_sals.star_rating}")

  end

  it 'displays the star_rating of the restaurants' do
    visit "/restaurants/#{@stinky_petes.id}"

    expect(page).to have_content("OSHA Safety Certified: #{@stinky_petes.osha_safety_certified}")
    expect(page).to_not have_content("OSHA Safety Certified: #{@nice_smellin_sals.osha_safety_certified}")

  end

  it 'displays the star_rating of the restaurants' do
    visit "/restaurants/#{@stinky_petes.id}"

    expect(page).to have_content("Chefs: #{@stinky_petes.chefs.count}")
    expect(page).to have_content("Chefs: #{@nice_smellin_sals.chefs.count}")
  end
end