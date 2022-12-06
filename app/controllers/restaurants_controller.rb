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
    restaurant = Restaurant.create!(restaurant_params)
    redirect_to "/restaurants/#{restaurant.id}"
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to "/restaurants/#{@restaurant.id}"
  end

  private
    def restaurant_params
      params.permit(:name, :city, :star_rating, :osha_safety_certified)
    end
end