class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:notice] = "User Created Successfully"
            redirect_to users_path
        else
            flash[:alert] = "Error - Please try again to create an account"
            render :new, status: :unprocessable_entity
            # redirect_to new_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end