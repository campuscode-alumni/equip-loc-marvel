class Budget < ApplicationRecord

  validates :name, presence: true
  validates :contact_number, presence: true
  validates :email, presence: true
  validates :description, presence: true
end
