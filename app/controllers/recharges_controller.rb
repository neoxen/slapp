class RechargesController < InheritedResources::Base
  before_filter :authorize_admin!, :except => [:index, :show]

  def index
    @recharges = Recharge.page(params[:page]).per(5)
  end
end
