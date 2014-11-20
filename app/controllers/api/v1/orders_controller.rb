class API::V1::OrdersController < ApplicationController
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
end