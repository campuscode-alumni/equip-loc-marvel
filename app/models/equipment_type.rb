class EquipmentType < ApplicationRecord
  has_many :equipment
  has_one :price

  validates :name, presence: true
end
