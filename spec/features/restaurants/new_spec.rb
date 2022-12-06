require 'rails_helper'

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

RSpec.describe 'the restaurant creation' do
  it 'links to the new page from the restaurants index' do
    visit '/restaurants'

    click_link('New Restaurant')
    expect(current_path).to eq('/restaurants/new')
  end

  it 'can create a new restaurant' do
    visit '/restaurants/new'

    fill_in('name', with: "Average Aroma Amy's") 
    fill_in('city', with: "Seattle") 
    fill_in('star_rating', with: '4') 
    fill_in('osha_safety_certified', with: 'true')

    click_button('Create Restaurant')

    new_restaurant_id = Restaurant.last.id

    expect(current_path).to eq("/restaurants/#{new_restaurant_id}")
    expect(page).to have_content("Average Aroma Amy's")
    expect(page).to have_content("Seattle")
    expect(page).to have_content("4")
    expect(page).to have_content("true")
  end
end