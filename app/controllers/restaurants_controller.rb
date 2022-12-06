class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.order(created_at: :desc)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new

  end

  def create
    restaurant = Restaurant.create!(name: params[:name], city: params[:city], star_rating: params[:star_rating], osha_safety_certified: [:osha_safety_certified])
    redirect_to "/restaurants/#{restaurant.id}"
  end

  private
    def restaurant_params
      
    end
end