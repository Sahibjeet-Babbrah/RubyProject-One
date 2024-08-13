class RfqsController < ApplicationController
  before_action :set_fields, only: %i[new create]

  def new
    @rfq = Rfq.new#; @rfq.items.build;
    # 2.times {@rfq.items.build}
    @user = User.new
  end

  def create
    @rfq = Rfq.create(rfq_params)

    if @rfq.valid?
      @rfq.save
      session[:notice] = "Rfq Created"
      redirect_to pages_dashboard_path
    else
      # flash[:alert] = "Error - Please try again"
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @rfq = Rfq.find(params[:id])
    @quotes = @rfq.quotes
  end

  def update
    @rfq = Rfq.find(params[:id])
  end

  def destroy
    @rfq.destroy
    respond_to do |format|
      format.html {redirect_to user_url}
      format.json {head :no_content}
    end
  end

  def set_fields
    @user_array = User.all.map {|user| [user.name, user.id]}
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def rfq_params
    params.require(:rfq).permit(:pickup_name, :pickup_street_address, :pickup_city_area, :pickup_city, :pickup_county, :pickup_state, :pickup_postal, :pickup_country,
                                :shipto_name, :shipto_street_address, :shipto_city_area, :shipto_city, :shipto_county, :shipto_state, :shipto_postal, :shipto_country,
                                :pickup_date, :delivery_date, :state, :user_id,
                                :items_attributes => [:id, :_destroy, :name, :length, :width, :height, :weight, :description, :special_conditions],
                                :quotes_attributes => [:id, :_destroy, :cost, :special_conditions, :state, :rfq_id, :user_id])
  end

end
