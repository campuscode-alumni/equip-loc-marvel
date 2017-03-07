class EquipmentType < ApplicationRecord
  has_many :equipment
  has_one :price
end
