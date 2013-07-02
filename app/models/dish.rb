class Dish < ActiveRecord::Base
  attr_accessible :description, :name, :price, :remark, :is_today, :set_date
end
