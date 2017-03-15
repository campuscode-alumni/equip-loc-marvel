class EquipmentType < ApplicationRecord
  has_many :equipment
  has_many :prices

  validates :name, presence: true

  def current_price(rental_period)
    # pegar todoso precos, encontrar somente os precos para o mesmo rental_period, e retornar o ultimo preco
      self.prices.each do |price|
        self.rental_period += equip.equipment_type.current_price(self.rental_period)
      end
  end
end
