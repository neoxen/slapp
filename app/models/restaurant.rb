class Restaurant < ActiveRecord::Base
  has_many :dishes
  has_many :orders
  attr_accessible :address, :name, :phone, :remark
end
