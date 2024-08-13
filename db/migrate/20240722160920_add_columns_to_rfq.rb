class AddColumnsToRfq < ActiveRecord::Migration[7.1]
  def change
    add_column :rfqs, :pickup_state, :string
    add_column :rfqs, :shipto_state, :string
  end
end
