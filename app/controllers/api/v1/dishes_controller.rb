class API::V1::DishesController < ApplicationController
	before_filter :authenticate_user!
  	before_filter :authorize_admin!, :only => [:delete, :update]

	def index
		date = Time.now
	    date_today = date.strftime("%Y-%m-%d")
	    @dishes = Dish.find_all_by_is_today_and_set_date(true, date_today)

	   	respond_to do |format|
	      format.json { render json: @dishes }
	    end
	end
end