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

    def dashboard
        if current_user.blank?
            render plain: '401 Unauthorized', status: :unauthorized
        else
            @rfq_data = Rfq.where(:user_id => current_user.id)
            @quote_request_data = Quote.where(:user_id => current_user.id)
        end
    end
end