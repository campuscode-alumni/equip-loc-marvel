class Equipment < ApplicationRecord
  has_many :rented_equipments
  has_many :contracts, through: :rented_equipments
  has_many :return_receipts
  belongs_to :equipment_type

  validates :name, :description, :serial_number, :acquisition_value,
  :acquisition_date, :shelf_life, :picture, :equipment_type,
  :manufacture, :vendor, presence: true
end
