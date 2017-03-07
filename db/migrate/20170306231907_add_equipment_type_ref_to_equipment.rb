class AddEquipmentTypeRefToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_reference :equipment, :equipment_type, foreign_key: true
  end
end
