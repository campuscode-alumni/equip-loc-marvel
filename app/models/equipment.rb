class Equipment < ApplicationRecord

  validates :name, :description, :serial_number, :acquisition_value,
  :acquisition_date, :shelf_life, :picture, :equipment_type,
  :manufacture, :vendor, presence: true


end
