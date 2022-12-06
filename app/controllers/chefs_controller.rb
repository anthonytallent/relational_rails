class ChefsController < ApplicationController

  def index
    @chefs = Chef.only_true
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def edit
    # binding.pry
    @chef = Chef.find(params[:id])
  end

  def update 
    @chef = Chef.find(params[:id])
    @chef.update(chef_params)
    redirect_to "/chefs/#{@chef.id}"
  end

  private
    def chef_params
      params.permit(:resstaurant_id, :name, :age, :title, :full_time)
    end
end 