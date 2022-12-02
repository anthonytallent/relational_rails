class AddRestaurantToChefs < ActiveRecord::Migration[5.2]
  def change
    add_reference :chefs, :restaurant, foreign_key: true
  end
end
