class AddCurrencyToQuote < ActiveRecord::Migration[7.1]
  def change
    add_column :quotes, :currency, :string
  end
end
