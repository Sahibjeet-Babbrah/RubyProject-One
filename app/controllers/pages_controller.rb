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

    def favourite_users
        if current_user.blank?
            render plain: '401 Unauthorized', status: :unauthorized
        else
            # query the sorting
            column = params[:column]
            direction = params[:direction]

            # base query
            @cur_user = User.find(current_user.id)
            @users = User.where.not(:id => current_user.id)

            # add sort if direction is given
            @users = if direction == '' || column.blank?
                @users.order('users.id')
            else
                @users.order("#{column} #{direction}")
            end

            # add partial match queries
            city_filter = params[:city_filter]
            country_filter = params[:country_filter]
            trucks_filter = params[:truck_filter]
            @users = @users.where('users.country like ?', "%#{country_filter}%") if country_filter.present?
            @users = @users.where('users.city like ?', "%#{city_filter}%") if city_filter.present?
            if trucks_filter == "Flatbed"
                @users = @users.where('users.flatbed_trucks')
            elsif trucks_filter == "Refrigerated"
                @users = @users.where('users.refrigerated_trucks')
            elsif trucks_filter == "Straight"
                @users = @users.where('users.straight_trucks')
            elsif trucks_filter == "Tanker"
                @users = @users.where('users.tanker_trucks')
            elsif trucks_filter == "Jumbo Trailer"
                @users = @users.where('jumbo_trailer_trucks')
            elsif trucks_filter == "Semi Trailer"
                @users = @users.where('semi_trailer_trucks')
            elsif trucks_filter == "Dump"
                @users = @users.where('dump_trucks')
            elsif trucks_filter == "Box"
                @users = @users.where('box_trucks')
            elsif trucks_filter == "Tail Lift"
                @users = @users.where('tail_lift_trucks')
            end
        end
    end
end