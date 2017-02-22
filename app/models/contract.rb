class Contract < ApplicationRecord

  before_save :evaluate_total_amount
  before_save :evaluate_end_date

  def evaluate_total_amount
    self.total_amount = self.amount - self.discount
  end

  def evaluate_end_date
    self.end_date = self.start_date + self.rental_period.days
  end

end
