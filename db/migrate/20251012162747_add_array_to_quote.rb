class AddArrayToQuote < ActiveRecord::Migration[7.1]
  def change
    add_columns :quotes, :users_send_quote, type: :text
  end
end
