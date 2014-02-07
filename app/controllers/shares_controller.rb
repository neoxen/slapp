class SharesController < InheritedResources::Base
  def choose
    @users = User.all

    respond_to do |format|
      format.html # choose.html.erb
      format.json { render json: @orders }
    end
  end

end
