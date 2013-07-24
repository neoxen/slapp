class Recharge < ActiveRecord::Base

  belongs_to :user

  attr_accessible :operator, :recharge_amount, :recharge_date, :remark
end
