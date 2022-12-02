class CreateChefs < ActiveRecord::Migration[5.2]
  def change
    create_table :chefs do |t|
      t.string :name
      t.integer :age
      t.string :title
      t.boolean :full_time

      t.timestamps
    end
  end
end
