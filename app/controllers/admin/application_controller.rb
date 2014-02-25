class Admin::ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout 'admin'
  
  before_filter :authorize
  
  protected
  
  def authorize
    redirect_to admin_login_url unless User.find_by_id(session[:user_id])
  end
end
