require 'rails_helper'
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

RSpec.describe 'the chefs edit' do
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
  it 'links to the edit page' do

    visit "/chefs/#{@crusty.id}"

    click_link "Update #{@crusty.name}"

    expect(current_path).to eq("/chefs/#{@crusty.id}/edit")
  end

  it 'can edit the restaurant' do
    # restaurant = Restaurant.create!(name: "Stinky Pete's", city: "Redlands", star_rating: 1, osha_safety_certified: false)

    visit "/chefs/#{@crusty.id}"

    expect(page).to have_content("Crusty Calvin")

    click_link "Update Crusty Calvin"

    fill_in 'name', with: 'Saul Goodman'
    fill_in 'age', with: '25'
    fill_in 'title', with: 'Line Cook'
    fill_in 'full_time', with: 'true'
    click_button 'Update Chef'

    expect(current_path).to eq("/chefs/#{@crusty.id}")
    expect(page).to have_content("Saul Goodman")
    expect(page).to have_content(25)
    expect(page).to have_content("Line Cook")
    expect(page).to have_content(true)
  end
end