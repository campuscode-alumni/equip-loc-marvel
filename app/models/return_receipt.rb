class ReturnReceipt < ApplicationRecord
  belongs_to :contract

  validates :name , :cpf, presence: true
end
