class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :description
      t.string :serial_number
      t.decimal :acquisition_value
      t.datetime :acquisition_date
      t.integer :shelf_life
      t.string :picture
      t.string :equipment_type
      t.string :manufacture
      t.string :vendor

      t.timestamps
    end
  end
end
