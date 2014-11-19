class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  after_filter :set_csrf_cookie_for_ng 
  def set_csrf_cookie_for_ng 
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery? 
  end 

  protected 
  def verified_request? 
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN'] 
  end

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
