class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:sessions][:email])
    if @user && @user.authenticate(params[:sessions][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successfully logged in!"

      redirect_to @user
    else
      flash[:alert] = "Incorrect email or password, try again."
      redirect_to "/login"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "You have been logged out!"
  end
end