class AccountsController < ApplicationController
  before_filter :authorize_admin!, :except => [:index, :show]

  def create
  end

  def index
    @accounts = Account.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])

    @recharge_record = Recharge.new(:operator => current_user.username, :recharge_date => Time.now)
    @recharge_record.user = @account.user

    before_amount = @account.amount

    respond_to do |format|
      if @account.update_attributes(params[:account])
        @recharge_record.recharge_amount = @account.amount
        @account.amount += before_amount
        if (@account.save && @recharge_record.save)
          format.html { redirect_to accounts_path, notice: 'Recharging successfully!' }
          format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end
end
