class Contract < ApplicationRecord
  has_many :rented_equipments
  has_many :equipment, through: :rented_equipments
  belongs_to :customer

  validates :equipment_ids, :rental_period, :amount, :delivery_address, :contact, :payment_method, :start_date, presence: {message: 'Informação obrigatória.'}

  before_save :evaluate_total_amount
  before_save :evaluate_end_date

  def evaluate_total_amount
    self.total_amount = amount - discount
  end

  def evaluate_end_date
    self.end_date = start_date + rental_period.days
  end

end
