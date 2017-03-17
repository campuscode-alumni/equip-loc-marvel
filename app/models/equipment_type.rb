class EquipmentType < ApplicationRecord
  has_many :equipment
  has_many :prices

  validates :name, presence: true

  def current_price(rental_period)
    rental_period_prices = self.prices.select do |price|
        price.rental_period == rental_period
    end
    if rental_period_prices.any?
      rental_period_prices.last.price
    else
      0
    end

  end
end
