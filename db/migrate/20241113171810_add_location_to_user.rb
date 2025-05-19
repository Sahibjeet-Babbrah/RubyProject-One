class AddLocationToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :street_address, :string
    add_column :users, :city_area, :string
    add_column :users, :city, :string
    add_column :users, :county, :string
    add_column :users, :postal, :string
    add_column :users, :country, :string
  end
end
