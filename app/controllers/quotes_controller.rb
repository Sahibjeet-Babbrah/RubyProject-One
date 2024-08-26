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
      # Quote is being submitted by the user
      if quote_params[:state] == nil
        @quote.update(quote_submitted: true, state: nil)
      else
        # Quote has been selected by RFQ creator, send the email here to update the person and link to the page
      end
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