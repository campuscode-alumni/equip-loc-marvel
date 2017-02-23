class Customer < ApplicationRecord

validates :name, presence: true
validates :customer_type, presence: true
validates :document, presence: true
validates :adress, presence: true
validates :email, presence: true
validates :contact_name, presence: true
validates :phone_number, presence: true
end
