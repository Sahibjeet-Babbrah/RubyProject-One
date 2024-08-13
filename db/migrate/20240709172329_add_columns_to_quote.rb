class AddColumnsToQuote < ActiveRecord::Migration[7.1]
  def change
    add_column :rfqs, :length, :decimal, precision: 5
    add_column :rfqs, :width, :decimal, precision: 5
    add_column :rfqs, :height, :decimal, precision: 5
    add_column :rfqs, :weight, :decimal, precision: 5
    add_column :rfqs, :special_conditions, :string
  end
end
