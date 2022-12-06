# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent

require 'rails_helper'

RSpec.describe 'destroy restaurant' do
  it 'deletes artist from show page' do
    restaurant = Restaurant.create!(name: "Sally Mae's", city: "Redlands", star_rating: 1, osha_safety_certified: false)
    visit "/restaurants/#{restaurant.id}"
    click_link "Delete #{restaurant.name}"
    expect(current_path).to eq('/restaurants')
    expect(page).to_not have_content("Sally Mae's")
  end
end