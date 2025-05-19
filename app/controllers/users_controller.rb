class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
        # @user.truck = Truck.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:notice] = "User Created Successfully"
            redirect_to users_path
        else
            flash[:alert] = "Error - Please try again to create an account"
            # TestMailer.simple_message("sahibjeetrules@gmail.com").deliver_later
            render :new, status: :unprocessable_entity
            # redirect_to new_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :street_address, :city_area, :city, :county, :postal, :state, :country,
                                     :flatbed_trucks, :refrigerated_trucks, :straight_trucks, :tanker_trucks, :jumbo_trailer_trucks, 
                                     :semi_trailer_trucks, :dump_trucks, :box_trucks, :tail_lift_trucks)
    end
end