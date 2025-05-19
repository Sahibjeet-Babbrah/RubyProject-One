class AddTrucksToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :truck_types, :string
  end
end
