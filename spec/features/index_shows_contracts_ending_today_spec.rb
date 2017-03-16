require 'rails_helper'

feature 'User visits home' do

  scenario 'and finds contracts ending today' do

    customer1 = create(:customer, name: 'Pedro')
    customer2 = create(:customer, name: 'Mariana')

    equipment_contract1 = create_list(:equipment, 3, :with_equipment_type_and_price)
    equipment_contract2 = create_list(:equipment, 2, :with_equipment_type_and_price)

    contract1 = create(:contract, customer: customer1, delivery_address: 'endereco1', equipment: equipment_contract1, start_date: '2017-01-01', rental_period: 3)
    contract2 = create(:contract, customer: customer2, delivery_address: 'endereco2', equipment: equipment_contract2, start_date: '2017-01-01', rental_period: 3)

    puts contract1.end_date

    Timecop.travel('2017-01-04')

    visit root_path

    expect(page).to have_content(contract1.id)
    expect(page).to have_content(contract1.customer.name)
    expect(page).to have_content(contract1.delivery_address)
    expect(page).to have_content('3 equipamentos')

    expect(page).to have_content(contract2.id)
    expect(page).to have_content(contract2.customer.name)
    expect(page).to have_content(contract2.delivery_address)
    expect(page).to have_content('2 equipamentos')
  end

  scenario 'and there are no contracts ending today' do

    Timecop.travel('2017-01-04')

    visit root_path

    expect(page).to have_content('Sem contratos vencendo hoje.')
  end

end
