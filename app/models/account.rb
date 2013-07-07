class Account < ActiveRecord::Base

  belongs_to :user

  attr_accessible :amount, :remark
end
