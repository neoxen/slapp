class IndexController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    date = Time.now
    date_today = date.strftime("%Y-%m-%d")
    @dishes_today = Dish.find_all_by_is_today_and_set_date(true, date_today)

    @last_post = Post.last

    if current_user.account.nil?
      user_account = Account.new(:amount => 0)
      current_user.account = user_account
    end
  end
end