class Dish < ActiveRecord::Base
  belongs_to :restaurant
  attr_accessible :restaurant_id, :description, :name, :price, :remark, :is_today, :set_date
end
