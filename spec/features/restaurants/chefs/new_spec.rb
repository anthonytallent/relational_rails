# User Story 13, Parent Child Creation 

# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe 'the restaurant_chefs creation' do
  before :each do 
    @stinky_petes = Restaurant.create!(name: "Stinky Pete's", city: "Redlands", star_rating: 1, osha_safety_certified: false)
    @nice_smellin_sals = Restaurant.create!(name: "Nice Smellin' Sal's", city: "Redlands", star_rating: 5, osha_safety_certified: true)

    # @stephanie = @nice_smellin_sals.chefs.create!(name: "Stephanie Cobalt", age: 27, title: "Sous Chef", full_time: true)
    # @susie = @nice_smellin_sals.chefs.create!(name: "Susie Mae", age: 21, title: "Assistant Sous Chef", full_time: true)
    # @bellatrix = @nice_smellin_sals.chefs.create!(name: "Bellatrix Le Yum", age: 38, title: "Pastry Chef", full_time: true)
    # @crusty = @stinky_petes.chefs.create!(name: "Crusty Calvin", age: 104, title: "Sous Chef", full_time: false)
    # @slimy = @stinky_petes.chefs.create!(name: "Slimy Susan", age: 78, title: "Assistant Sous Chef", full_time: false)
    # @nasty = @stinky_petes.chefs.create!(name: "Nasty Norman", age: 12, title: "Owner", full_time: true)  
  end
  it 'links to the new page from the restaurants index' do
    visit "/restaurants/#{@stinky_petes.id}/chefs"

    click_link('Create Chef')
    expect(current_path).to eq("/restaurants/#{@stinky_petes.id}/chefs/new")

  end

  it 'can create a new chef' do
    visit "/restaurants/#{@stinky_petes.id}/chefs/new"

    fill_in('name', with: "Stinky Stanley") 
    fill_in('age', with: "108") 
    fill_in('title', with: 'Squatter') 
    fill_in('full_time', with: 'true')

    click_button('Create Chef')

    new_chef_id = Chef.last.id

    expect(current_path).to eq("/restaurants/#{@stinky_petes.id}/chefs")
    expect(page).to have_content("Stinky Stanley")
    expect(page).to have_content(108)
    expect(page).to have_content('Squatter')
    expect(page).to have_content(true)
  end
end
