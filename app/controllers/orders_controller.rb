class OrdersController < InheritedResources::Base
  before_filter :authenticate_user!

  def index
    @user = current_user
    @orders = @user.orders
    @recharge_records = @user.recharges

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

  def dish_order
    @dish = Dish.find(params[:id])

    @user_order = Order.new()

    @user_order.dish_name = @dish.name
    @user_order.dish_price = @dish.price
    @user_order.order_date = Time.now.strftime("%Y-%m-%d")
    @user_order.restaurant = @dish.restaurant

    @user_order.user = current_user

    user_account = current_user.account

    respond_to do |format|
      if @user_order.save
        user_account.amount -= @dish.price
        user_account.save
        format.html { redirect_to orders_path, notice: 'Order successfully!' }
        format.json { render json: @user_order }
      else
        format.html { render action: "index" }
        format.json { render json: @user_order.errors, status: :unprocessable_entity }
      end
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
