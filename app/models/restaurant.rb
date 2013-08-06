class Restaurant < ActiveRecord::Base
  has_many :dishes, dependent: :destroy
  has_many :orders, dependent: :destroy
  attr_accessible :address, :name, :phone, :remark
end
