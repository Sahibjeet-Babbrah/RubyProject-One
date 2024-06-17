class UserSessionsController < ApplicationController
  # Shows the login page
  def new
    @user = User.new
  end

  # User the created username and password to login the user
  def create
    # Finds the user by the username entered
    @user = User.find_by(name: params[:user][:name])

    # User.authenticate verifies the data entered, method provided by has_secure_password
    if @user && @user.authenticate(params[:user][:password])
      # Returns the user_id in the form of a encrypted cookie back to the user browser
      # Store the user_id so the next time when a controller checks the session, it knows the user is logged in
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "Login Failed"
      redirect_to new_user_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
