class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        # If session[:user_id] is nil, set it to nil, otherwise find the user by id
        @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
    end

    # https://dev.to/kevinluo201/building-a-simple-authentication-in-rails-7-from-scratch-2dhb
    # Add a public page and a restricted page
end
