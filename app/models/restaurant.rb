class Restaurant < ApplicationRecord
  has_many :chefs

  # def self.most_recently_created
  #   order(created_at: :desc)
  # end
end