class DropAddressList < ActiveRecord::Migration[7.1]
  def change
    drop_table :address_lists
    drop_table :items
    drop_table :quote_connections
    drop_table :quotes
    drop_table :users

    # Create all the tables and connections
  end
end
