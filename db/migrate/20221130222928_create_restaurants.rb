class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :city
      t.integer :star_rating
      t.boolean :osha_safety_certified

      t.timestamps
    end
  end
end
