require 'rails_helper'

feature 'User visits home' do

  scenario 'and finds it pimped up' do

    contract1 = build(:contract)
    contract2 = build(:contract)

    customer = create(:customer)

    equipment_type1 = create(:equipment_type)
    equipment_type2 = create(:equipment_type)

    price1 = create(:price, equipment_type: equipment_type1, rental_period: contract1.rental_period)
    price2 = create(:price, equipment_type: equipment_type2, rental_period: contract2.rental_period)

    equipment1_contract1 = create(:equipment, equipment_type: equipment_type1)
    equipment2_contract1 = create(:equipment, equipment_type: equipment_type1)
    equipment3_contract1 = create(:equipment, equipment_type: equipment_type2)

    equipment1_contract2 = create(:equipment, equipment_type: equipment_type2)
    equipment2_contract2 = create(:equipment, equipment_type: equipment_type2)

    contract1.equipment << [equipment1_contract1, equipment2_contract1, equipment3_contract1]
    contract2.equipment << [equipment1_contract2, equipment2_contract2]

    contract1.customer = customer
    contract2.customer = customer

    contract1.save
    contract2.save

    visit root_path

    expect(page).to have_content(contract1.id)
    expect(page).to have_content(contract1.customer.name)
    expect(page).to have_content(contract1.total_amount)
    expect(page).to have_content(contract1.start_date)
    expect(page).to have_content(contract1.end_date)

    expect(page).to have_content(contract2.id)
    expect(page).to have_content(contract2.customer.name)
    expect(page).to have_content(contract2.total_amount)
    expect(page).to have_content(contract2.start_date)
    expect(page).to have_content(contract2.end_date)
  end

  scenario 'no contracts available' do
    visit root_path

    expect(page).to have_content('Não há nenhum contrato cadastrado')
  end

end
