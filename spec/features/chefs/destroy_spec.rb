# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child
require 'rails_helper'

RSpec.describe 'destroy chef' do
  it 'deletes chef from show page' do
    restaurant = Restaurant.create!(name: "Sally Mae's", city: "Redlands", star_rating: 1, osha_safety_certified: false)
    chef = restaurant.chefs.create!(name: "Crusty Calvin", age: 104, title: "Sous Chef", full_time: false)
    visit "/chefs/#{chef.id}"
    click_link "Delete #{chef.name}"
    expect(current_path).to eq('/chefs')
    expect(page).to_not have_content("Sally Mae's")
  end
end