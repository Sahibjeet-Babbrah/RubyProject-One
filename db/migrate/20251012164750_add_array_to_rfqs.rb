class AddArrayToRfqs < ActiveRecord::Migration[7.1]
  def change
    remove_column :quotes, :users_send_quote
    add_columns :rfqs, :users_send_quote, type: :text
  end
end
