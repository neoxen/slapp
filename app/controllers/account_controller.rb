class AccountController < ApplicationController
  def create
  end

  def add
  end

  def show
    @user = User.find(params[:id])
  end
end
