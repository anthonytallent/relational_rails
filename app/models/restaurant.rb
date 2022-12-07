class Restaurant < ApplicationRecord
  has_many :chefs

  def chefs_count
    chefs.count
  end

  def alphabetical
    chefs.order(:name)
  end

  def chefs_greater_than(input_age)
    chefs.where("age > #{input_age}")
  end

  # def self.most_recently_created
  #   order(created_at: :desc)
  # end
end