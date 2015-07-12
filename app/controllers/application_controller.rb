class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_dashboard_path, :alert => exception.message
  end

  def access_denied(exception)
   redirect_to admin_dashboard_path, :alert => exception.message
  end
  #https://github.com/ryanb/cancan/wiki/Changing-Defaults
  def current_ability
   @current_ability ||= Ability.new(current_admin_user)
  end

end
