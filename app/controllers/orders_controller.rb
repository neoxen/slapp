class OrdersController < InheritedResources::Base
  def index
    @user = current_user
    @orders = @user.orders

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
end
