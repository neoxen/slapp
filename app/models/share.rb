class Share < ActiveRecord::Base
  attr_accessible :remark, :sharing_content, :sharing_date, :sum_graded, :total_grade, :user_id

  belongs_to :user
end
