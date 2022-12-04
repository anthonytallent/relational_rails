class RestaurantChefsController < ApplicationController

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @chefs = @restaurant.chefs
  end
end