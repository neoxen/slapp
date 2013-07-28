class Order < ActiveRecord::Base
  attr_accessible :dish_name, :dish_price, :order_date, :remark

  belongs_to :user
  belongs_to :restaurant

  validates :user_id, presence: true
end
