require 'rails_helper'

RSpec.describe 'the restaurant_chefs index page' do
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

  it 'displays the name of the restaurant associated with the id' do
    visit "/restaurants/#{@stinky_petes.id}/chefs"

    expect(page).to have_content("#{@stinky_petes.name} Chefs")
    expect(page).to_not have_content("#{@nice_smellin_sals.name} Chefs")

  end

  it 'I see the resstaurant chefs with that restaurant_id including the attributes' do 
    visit "/restaurants/#{@stinky_petes.id}/chefs"

    expect(page).to have_content(@crusty.name)
    expect(page).to have_content("Age: #{@crusty.age}")
    expect(page).to have_content("Title: #{@crusty.title}")
    expect(page).to have_content("Full Time Status: #{@crusty.full_time}")
  end

  it 'I see the resstaurant chefs with that restaurant_id including the attributes' do 
    visit "/restaurants/#{@stinky_petes.id}/chefs"

    expect(page).to have_content(@slimy.name)
    expect(page).to have_content("Age: #{@slimy.age}")
    expect(page).to have_content("Title: #{@slimy.title}")
    expect(page).to have_content("Full Time Status: #{@slimy.full_time}")
  end

  it 'I see the resstaurant chefs with that restaurant_id including the attributes' do 
    visit "/restaurants/#{@stinky_petes.id}/chefs"

    expect(page).to have_content(@nasty.name)
    expect(page).to have_content("Age: #{@nasty.age}")
    expect(page).to have_content("Title: #{@nasty.title}")
    expect(page).to have_content("Full Time Status: #{@nasty.full_time}")
  end

  it 'displays the name of the restaurant associated with the id' do
    visit "/restaurants/#{@nice_smellin_sals.id}/chefs"

    expect(page).to have_content("#{@nice_smellin_sals.name} Chefs")
    expect(page).to_not have_content("#{@stinky_petes.name} Chefs")

  end

  it 'I see the resstaurant chefs with that restaurant_id including the attributes' do 
    visit "/restaurants/#{@nice_smellin_sals.id}/chefs"

    expect(page).to have_content(@stephanie.name)
    expect(page).to have_content("Age: #{@stephanie.age}")
    expect(page).to have_content("Title: #{@stephanie.title}")
    expect(page).to have_content("Full Time Status: #{@stephanie.full_time}")
  end

  it 'I see the resstaurant chefs with that restaurant_id including the attributes' do 
    visit "/restaurants/#{@nice_smellin_sals.id}/chefs"

    expect(page).to have_content(@susie.name)
    expect(page).to have_content("Age: #{@susie.age}")
    expect(page).to have_content("Title: #{@susie.title}")
    expect(page).to have_content("Full Time Status: #{@susie.full_time}")
  end

  it 'I see the restaurant chefs with that restaurant_id including the attributes' do 
    visit "/restaurants/#{@nice_smellin_sals.id}/chefs"

    expect(page).to have_content(@bellatrix.name)
    expect(page).to have_content("Age: #{@bellatrix.age}")
    expect(page).to have_content("Title: #{@bellatrix.title}")
    expect(page).to have_content("Full Time Status: #{@bellatrix.full_time}")
  end

  it 'I see the restaurant chefs with ages greater than the input value' do
    visit "/restaurants/#{@nice_smellin_sals.id}/chefs"

    fill_in('age', with: "21") 
    click_button "Sort #{@nice_smellin_sals.name} Chefs who are older than *input number*"

    expect(page).to have_content(@bellatrix.name)
    expect(page).to have_content(@stephanie.name)
    expect(page).to_not have_content(@susie.name)

  end


end