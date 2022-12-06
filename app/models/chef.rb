class Chef < ApplicationRecord
  belongs_to :restaurant

  def self.only_true 
    all.where(full_time: :true)
  end
end