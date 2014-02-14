class SharesController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :authorize_admin!, :only => [:delete, :update, :list, :choose]
  before_filter :active_sharers

  def choose
    @users = User.all

    respond_to do |format|
      format.html # choose.html.erb
      format.json { render json: @users }
    end
  end

  def index
    date = Time.now

    if params[:share_date].nil?
      date_today = date.strftime("%Y-%m-%d")
    else
      date_today = Date.civil(params[:share_date][:year].to_i, params[:share_date][:month].to_i, params[:share_date][:day].to_i)
    end

    @shares = Share.find_all_by_sharing_date(date_today, :order => 'sharing_date DESC')


    #@total = 0
    #@orders.each do |order|
    #  @total += order.dish_price
    #end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shares }
    end
  end

  def list
    date = Time.now

    if ((params[:shares_year].nil?) || (params[:shares_month].nil?))
      shares_year = date.year
      shares_month = date.month
    else
      shares_year = params[:shares_year][:year].to_i
      shares_month = params[:shares_month][:month].to_i
    end

    shares_date = Date.civil(shares_year, shares_month, 1)
    shares_date_month = shares_date.end_of_month

    @shares = Share.where(:sharing_date => shares_date..shares_date_month)

    respond_to do |format|
      format.html # list.html.erb
      format.json { render json: @shares }
    end

  end

  def grade
    @share = Share.find(params[:id])

    name_list = @share.remark
    sum_graded = @share.sum_graded
    total_grade = @share.total_grade

    if name_list.nil?
      name_list = ''
    end

    if sum_graded.nil?
      sum_graded = 0
    end

    if total_grade.nil?
      total_grade = 0
    end

    if @share.is_archived
      respond_to do |format|
        format.html { redirect_to shares_path, alert: t('global.share.error.archived') }
        format.json { head :no_content }
      end
    else
      if name_list.include?(current_user.username)
        respond_to do |format|
          format.html { redirect_to shares_path, alert: t('global.share.error.voted') }
          format.json { head :no_content }
        end
      else
        tsum = sum_graded * total_grade + params[:grade_point].to_i
        pnum = total_grade + 1
        tsum = tsum / pnum

        @share.sum_graded = tsum
        @share.total_grade = pnum
        @share.remark = name_list + "." + current_user.username

        @share.save
        respond_to do |format|
          format.html { redirect_to shares_path, notice: t('global.share.info.voted1') + @share.user.username + t('global.share.info.voted2') }
          format.json { head :no_content }
        end
      end
    end
  end

  def active_sharers
    @active_sharers = User.find_all_by_is_sharer(true)
  end
end
