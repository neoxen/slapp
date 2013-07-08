class IndexController < ApplicationController
  
  def index
    date = Time.now
    date_today = date.strftime("%Y-%m-%d")
    @dishes_today = Dish.find_all_by_is_today_and_set_date(true, date_today)

    @last_post = Post.last
  end
end