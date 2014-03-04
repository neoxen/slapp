class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  private
  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = 'You must be an admin to do that.'
      redirect_to root_path
    end
  end

  def set_locale
  	I18n.locale = params[:locale] || I18n.default_locale
  end
end
