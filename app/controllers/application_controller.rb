class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Use the current_user method as a helper method.
  helper_method :current_user

  # The current_user method simply tries to look up the user by the user_id stored in session
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
