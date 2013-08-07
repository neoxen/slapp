class RechargesController < InheritedResources::Base
  before_filter :authorize_admin!, :except => [:index, :show]

  def index
    @recharges = Recharge.order('recharge_date DESC').page(params[:page])
  end
end
