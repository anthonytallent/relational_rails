# User Story 12, Parent Update 

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
require 'rails_helper'

RSpec.describe 'the restaurant edit' do
  it 'links to the edit page' do
    restaurant = Restaurant.create!(name: "Stinky Pete's", city: "Redlands", star_rating: 1, osha_safety_certified: false)

    visit '/restaurants'

    click_button "Edit #{restaurant.name}"

    expect(current_path).to eq("/restaurants/#{restaurant.id}/edit")
  end

  it 'can edit the restaurant' do
    restaurant = Restaurant.create!(name: "Stinky Pete's", city: "Redlands", star_rating: 1, osha_safety_certified: false)

    visit "/restaurants"

    expect(page).to have_content("Stinky Pete's")

    click_button "Edit Stinky Pete's"

    fill_in 'name', with: 'Smelly guy'
    fill_in 'city', with: 'Highland'
    fill_in 'star_rating', with: '2'
    fill_in 'osha_safety_certified', with: 'true'
    click_button 'Update Restaurant'

    expect(current_path).to eq("/restaurants/#{restaurant.id}")
    expect(page).to have_content("Smelly Guy")
  end
end