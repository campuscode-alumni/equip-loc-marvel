class Price < ApplicationRecord
  belongs_to :equipment_type
  validates :rental_period, :price, presence: { message: 'Campo Obrigatório'}
end
