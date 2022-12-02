require 'rails_helper'

RSpec.describe 'the restaurants show page' do
  before :each do 
    @stinky_petes = Restaurant.create!(name: "Stinky Pete's", city: "Redlands", star_rating: 1, osha_safety_certified: false)
    @nice_smellin_sals = Restaurant.create!(name: "Nice Smellin' Sal's", city: "Los Angeles", star_rating: 5, osha_safety_certified: true)
  end
  it 'displays the name of the restaurants' do
    visit "/restaurants/#{@stinky_petes.id}"

    expect(page).to have_content(@stinky_petes.name)
    expect(page).to_not have_content(@nice_smellin_sals.name)

  end

  it 'displays the name of the restaurants' do
    visit "/restaurants/#{@stinky_petes.id}"

    expect(page).to have_content(@stinky_petes.city)
    expect(page).to_not have_content(@nice_smellin_sals.city)

  end

  it 'displays the star_rating of the restaurants' do
    visit "/restaurants/#{@stinky_petes.id}"

    expect(page).to have_content(@stinky_petes.star_rating)
    expect(page).to_not have_content(@nice_smellin_sals.star_rating)

  end

  it 'displays the star_rating of the restaurants' do
    visit "/restaurants/#{@stinky_petes.id}"

    expect(page).to have_content(@stinky_petes.osha_safety_certified)
    expect(page).to_not have_content(@nice_smellin_sals.osha_safety_certified)

  end
end