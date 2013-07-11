class OrdersController < InheritedResources::Base
  def index
    @user = current_user
    @orders = @user.orders

    date = Time.now
    date_today = date.strftime("%Y-%m-%d")
    @dishes_today = Dish.find_all_by_is_today_and_set_date(true, date_today)

    if current_user.account.nil?
      user_account = Account.new(:amount => 0)
      current_user.account = user_account
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def list

    date = Time.now
    date_today = date.strftime("%Y-%m-%d")

    @orders = Order.find_all_by_order_date(date_today)


    @total = 0
    @orders.each do |order|
       @total += order.dish_price
    end

    respond_to do |format|
      format.html # list.html.erb
      format.json { render json: @orders }
    end
  end
end
