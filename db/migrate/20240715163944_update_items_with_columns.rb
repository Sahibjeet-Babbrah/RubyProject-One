class UpdateItemsWithColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :length, :decimal, precision: 5
    add_column :items, :width, :decimal, precision: 5
    add_column :items, :height, :decimal, precision: 5
    add_column :items, :weight, :decimal, precision: 5
    add_column :items, :special_conditions, :string
  end
end
