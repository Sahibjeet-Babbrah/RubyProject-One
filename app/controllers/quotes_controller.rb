class QuotesController < ApplicationController

  def edit
    @quote = Quote.find(params[:id])
  end
  
  def select
    
  end

  def view
    @rfq = Rfq.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update(quote_params)
      print(quote_params)
      redirect_to pages_dashboard_path
    else
      render :edit, status: :unprocessable_content
    end
  end

  private
    def quote_params
      params.require(:quote).permit(:cost, :special_conditions, :state, :quote_submitted, :rfq_state, :rfq_length)
    end
end