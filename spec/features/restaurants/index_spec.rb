require 'rails_helper'

RSpec.describe 'the restaurants index page' do
  before :each do 
    @sally_maes = Restaurant.create!(name: "Sally Mae's", city: "Redlands", star_rating: 1, osha_safety_certified: false)
    @nice_smellin_sals = Restaurant.create!(name: "Nice Smellin' Sal's", city: "Redlands", star_rating: 5, osha_safety_certified: true)
  end
  it 'displays the names of all the restaurants' do
    visit '/restaurants'

    expect(page).to have_content(@sally_maes.name)
    expect(page).to have_content(@nice_smellin_sals.name)

  end

  it 'displays the created_at times of all the restaurants' do
    visit '/restaurants'

    expect(page).to have_content(@sally_maes.created_at)
    expect(page).to have_content(@nice_smellin_sals.created_at)

  end

  it 'deletes a restaurant if the link is clicked' do
    visit '/restaurants'
    expect(page).to have_content(@sally_maes.name)
    click_link "Delete #{@sally_maes.name}"
    expect(page).to_not have_content(@sally_maes.name)
  end
end