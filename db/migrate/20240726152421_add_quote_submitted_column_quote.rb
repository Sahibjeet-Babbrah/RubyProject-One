class AddQuoteSubmittedColumnQuote < ActiveRecord::Migration[7.1]
  def change
    add_column :quotes, :quote_submitted, :boolean
  end
end
