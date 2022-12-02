require 'rails_helper'

RSpec.describe 'the chefs show page' do
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

  it 'I see the chef with that id including the attributes' do 
    visit "/chefs/#{@stephanie.id}"

    expect(page).to have_content(@stephanie.name)
    expect(page).to_not have_content(@crusty.name)
  end

  it 'I see the age of the chef' do
    visit "/chefs/#{@stephanie.id}"

    expect(page).to have_content("Age: #{@stephanie.age}")
    expect(page).to_not have_content("Age: #{@crusty.age}")
  end

  it 'I see the title of the chef' do
    visit "/chefs/#{@stephanie.id}"

    expect(page).to have_content("Title: #{@stephanie.title}")
    expect(page).to_not have_content("Title: #{@slimy.title}")
  end

  it 'I see the full time status of the chef' do
    visit "/chefs/#{@stephanie.id}"
# save_and_open_page
    expect(page).to have_content("Full Time Status: #{@stephanie.full_time}")
    expect(page).to_not have_content("Full Time Status: #{@slimy.full_time}")
  end
end