class CreateRfqs < ActiveRecord::Migration[7.1]
  def change
    create_table :rfqs do |t|
      t.string :pickup_name
      t.string :pickup_street_address
      t.string :pickup_city_area
      t.string :pickup_city
      t.string :pickup_county
      t.string :pickup_postal
      t.string :pickup_country
      t.string :shipto_name
      t.string :shipto_street_address
      t.string :shipto_city_area
      t.string :shipto_city
      t.string :shipto_county
      t.string :shipto_postal
      t.string :shipto_country
      t.date :pickup_date
      t.date :delivery_date
      t.boolean :state

      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
