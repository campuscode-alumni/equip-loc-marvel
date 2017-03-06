class RemoveEquipmentTypeFromEquipment < ActiveRecord::Migration[5.0]
  def change
    remove_column :equipment, :equipment_type, :string
  end
end
