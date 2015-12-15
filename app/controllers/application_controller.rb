class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :signed_in?, :current_user

  def signed_in?
  	current_user
  end

  def current_user  	  	
    @current_user ||= User.find_by(id: session[:user_id])
  end 

  def require_authenticate
    redirect_to log_in_path, flash: {error: "Please login"} unless signed_in?
  end

end
