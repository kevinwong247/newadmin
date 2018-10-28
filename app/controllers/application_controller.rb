class ApplicationController < ActionController::Base
  helper_method :current_user, :authorize

  def current_user
    if session[:user_id]
      @user ||= User.find(session[:user_id])
    end
  end

  def authorize
    if current_user.nil?
      redirect_to login_path, alert: "You must be logged in to an account"
    end
  end
end