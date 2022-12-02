require 'rails_helper'

RSpec.describe 'the restaurants index page' do
  before :each do 
    @stinky_petes = Restaurant.create!(name: "Stinky Pete's", city: "Redlands", star_rating: 1, osha_safety_certified: false)
    @nice_smellin_sals = Restaurant.create!(name: "Nice Smellin' Sal's", city: "Redlands", star_rating: 5, osha_safety_certified: true)
  end
  it 'displays the names of all the restaurants' do
    visit '/restaurants'

    expect(page).to have_content(@stinky_petes.name)
    expect(page).to have_content(@nice_smellin_sals.name)

  end
end