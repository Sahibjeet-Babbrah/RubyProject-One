class SessionsController < ApplicationController
  # Login is required before the create and new function can be used
  skip_before_action :require_login, only: [:create, :new]

  def new
  end

  def create
    session_params = params.permit(:email, :password)
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user_id
      redirect_to @user
    else
      flash[:notice] = "Login is Invalid!"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been signed out!"
    redirect_to new_session_path
  end
end
