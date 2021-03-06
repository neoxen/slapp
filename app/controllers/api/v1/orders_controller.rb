class API::V1::OrdersController < ApplicationController
	before_filter :authenticate_user!
  	before_filter :authorize_admin!, :only => [:delete, :update]

	def index
		date = Time.now

	    if params[:orders_date].nil?
	      date_today = date.strftime("%Y-%m-%d")
	    else
	      date_today = Date.civil(params[:orders_date][:year].to_i, params[:orders_date][:month].to_i, params[:orders_date][:day].to_i)
	    end

	    @orders = Order.find_all_by_order_date(date_today, :order => 'dish_name DESC')


	    # @total = 0
	    # @orders.each do |order|
	    #    @total += order.dish_price
	    # end

	    @orders.each do |order|
	       order.remark = order.user.username
	    end

	    respond_to do |format|
	      format.html # list.html.erb
	      format.json { render json: @orders }
	    end
	end

  	def create
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
	        format.html { redirect_to root_path, notice: t('global.order.info1') + @user_order.dish_name + t('global.order.info2') + @user_order.dish_price.to_s + t('global.order.info3') }
	        format.json { render json: @user_order }
	      else
	        format.html { render action: "index" }
	        format.json { render json: @user_order.errors, status: :unprocessable_entity }
	      end
	    end
  	end


	 # DELETE /orders/1
  	# DELETE /orders/1.json
  	def destroy
	    @order = Order.find(params[:id])
	    account = @order.user.account
	    account.amount += @order.dish_price
	    account.save
	    @order.destroy

	    respond_to do |format|
	      format.html { redirect_to list_today_path , notice: 'Order deleted successfully!'}
	      format.json { head :no_content }
	    end
  	end
end