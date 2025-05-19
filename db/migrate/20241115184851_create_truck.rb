class CreateTruck < ActiveRecord::Migration[7.1]
  def change
    create_table :trucks do |t|
      t.boolean :flatbed_trucks
      t.boolean :refrigerated_trucks
      t.boolean :straight_trucks
      t.boolean :tanker_trucks
      t.boolean :jumbo_trailer_trucks
      t.boolean :semi_trailer_trucks
      t.boolean :dump_trucks
      t.boolean :box_trucks
      t.boolean :tail_lift_trucks

      t.belongs_to :user, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
