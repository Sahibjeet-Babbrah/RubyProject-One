class AddBaseCurrencies < ActiveRecord::Migration[7.1]
  def change
    Currency.create(name: "CAN")
    Currency.create(name: "USD")
    Currency.create(name: "EUR")
  end
end
