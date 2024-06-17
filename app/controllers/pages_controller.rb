# app/controllers/pages_controller.rb
class PagesController < ApplicationController
    # Index is a public page
    def index
        # binding.break
    end

    # Secret is a private page, only logged-in user can view it
    def secret
        if current_user.blank?
            render plain: '401 Unauthorized', status: :unauthorized
        end
    end
end