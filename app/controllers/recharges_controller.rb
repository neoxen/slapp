class RechargesController < InheritedResources::Base
  before_filter :authorize_admin!, :except => [:index, :show]

  def index
    @recharges = Recharge.page(params[:page])
  end
end
