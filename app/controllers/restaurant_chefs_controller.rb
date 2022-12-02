class RestaurantChefsController < ApplicationController

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @chefs = @restaurant.chefs
    # binding.pry
  end
end