class UsersController < ApplicationController

  def set_is_sharer
    @user = User.find(params[:id])

    respond_to do |format|
      @user.is_sharer = 1
      @user.save
      format.html { redirect_to sharer_choose_path, notice: @user.username + ' selected!' }
      format.json { head :no_content }
    end
  end

  def unset_is_sharer
    @user = User.find(params[:id])

    respond_to do |format|
      @user.is_sharer = 0
      @user.save
      format.html { redirect_to sharer_choose_path, notice: @user.username + ' unselected!' }
      format.json { head :no_content }
    end
  end

end
