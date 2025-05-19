class AddColumnsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :flatbed_trucks, :boolean
    add_column :users, :refrigerated_trucks, :boolean
    add_column :users, :straight_trucks, :boolean
    add_column :users, :tanker_trucks, :boolean
    add_column :users, :jumbo_trailer_trucks, :boolean
    add_column :users, :semi_trailer_trucks, :boolean
    add_column :users, :dump_trucks, :boolean
    add_column :users, :box_trucks, :boolean
    add_column :users, :tail_lift_trucks, :boolean
  end
end
