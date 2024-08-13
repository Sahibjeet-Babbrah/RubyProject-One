class RemoveColumnsFromQuotes < ActiveRecord::Migration[7.1]
  def change
    remove_column :quotes, :length, :decimal
    remove_column :quotes, :width, :decimal
    remove_column :quotes, :height, :decimal
    remove_column :quotes, :weight, :decimal
  end
end
