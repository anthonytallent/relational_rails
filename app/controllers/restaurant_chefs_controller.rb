class RestaurantChefsController < ApplicationController

  def index
    # binding.pry
    @restaurant = Restaurant.find(params[:restaurant_id])
    @chefs = @restaurant.chefs
  end
end