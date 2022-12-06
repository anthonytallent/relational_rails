class RestaurantChefsController < ApplicationController

  def index
    # binding.pry
    @restaurant = Restaurant.find(params[:restaurant_id])
    @chefs = @restaurant.chefs
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @chef = Chef.create!(chef_params)
    redirect_to "/restaurants/#{@chef.restaurant_id}/chefs"
  end

  # def edit
  #   binding.pry
  #   @chef = Chef.find(params[:id])
  # end

  private
  def chef_params
    params.permit(:restaurant_id, :name, :age, :title, :full_time)
  end

  # def restaurant_params
  #   params.permit(:name, :city, :star_rating, :osha_safety_certified)
  # end
end