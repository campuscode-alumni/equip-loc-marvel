require 'rails_helper'

feature 'User visits home' do

  scenario 'and finds it pimped up' do


    customer = create(:customer)
    
    contract1 = build(:contract, start_date: '2017-01-01', rental_period: 2, discount: 0, customer: customer)
    contract2 = build(:contract, start_date: '2017-02-10', rental_period: 3, discount: 0, customer: customer)

    equipment_type1 = create(:equipment_type)
    equipment_type2 = create(:equipment_type)

    price1 = create(:price, price: 3, equipment_type: equipment_type1, rental_period: contract1.rental_period)
    price2 = create(:price, price: 14, equipment_type: equipment_type2, rental_period: contract2.rental_period)

    equipment1_contract1 = create(:equipment, equipment_type: equipment_type1)
    equipment2_contract1 = create(:equipment, equipment_type: equipment_type1)

    equipment1_contract2 = create(:equipment, equipment_type: equipment_type2)
    equipment2_contract2 = create(:equipment, equipment_type: equipment_type2)

    contract1.equipment << [equipment1_contract1, equipment2_contract1]
    contract2.equipment << [equipment1_contract2, equipment2_contract2]

    contract1.save
    contract2.save

    visit root_path

    within('div#all-contracts') do
      expect(page).to have_content(contract1.id)
      expect(page).to have_content(contract1.customer.name)
      expect(page).to have_content("R$ 6,00")
      expect(page).to have_content("01/01/2017")
      expect(page).to have_content("03/01/2017")

      expect(page).to have_content(contract2.id)
      expect(page).to have_content(contract2.customer.name)
      expect(page).to have_content("R$ 28,00")
      expect(page).to have_content("10/02/2017")
      expect(page).to have_content("13/02/2017")
    end
  end

  scenario 'no contracts available' do
    visit root_path

    expect(page).to have_content('Não há nenhum contrato cadastrado')
  end

end
