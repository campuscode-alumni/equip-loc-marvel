require 'rails_helper'

RSpec.describe Contract, type: :model do
  describe 'calculate total amount' do
    it 'use last price' do
      #setup
      equipment_type = create(:equipment_type, name: 'Furadeiras')
      equipment = create(:equipment, equipment_type: equipment_type)

      old_price = Price.create(rental_period: 3,
                        equipment_type: equipment_type,
                        price: 1000)
      current_price = Price.create(rental_period: 3,
                         equipment_type: equipment_type,
                         price: 2000)

      #execução
      contract = create(:contract, equipment: [equipment],
                        rental_period: 3, discount: 0)
      #expectativa
      expect(contract.amount).to eq(2000)
    end

    it '0 if no price' do
      #setup
      equipment_type = create(:equipment_type, name: 'Furadeiras')
      equipment = create(:equipment, equipment_type: equipment_type)

      #execução
      contract = create(:contract, equipment: [equipment],
                        rental_period: 3, discount: 0)
      #expectativa
      expect(contract.amount).to eq(0)
    end
  end
end
