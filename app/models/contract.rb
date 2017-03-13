class Contract < ApplicationRecord
  has_many :rented_equipments
  has_many :equipment, through: :rented_equipments
  belongs_to :customer


  validates :equipment_ids, :rental_period, :amount, :delivery_address,
  :contact, :payment_method, :start_date, presence: {message: 'Informação obrigatória.'}
  validate :validate_discount

  before_validation :evaluate_amount
  after_validation :evaluate_total_amount
  before_save :evaluate_end_date

  def evaluate_amount
    self.amount = 0
    self.equipment.each do |equip|
      self.amount += equip.equipment_type.price.price
    end
    self.amount = self.amount.round(2)
  end

  def evaluate_total_amount
    self.total_amount = (amount - discount).round(2)
  end

  def validate_discount
    if self.discount.nil?
      self.discount = 0
    elsif self.discount > amount
        errors.add(:discount, "can't be greater than amount")
    end
  end

  def evaluate_end_date
    self.end_date = start_date + rental_period.days
  end
end
