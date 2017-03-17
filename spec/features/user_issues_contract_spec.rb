require 'rails_helper'

feature 'User issues contract' do

  scenario 'successfully' do


    type = create(:equipment_type, name: 'Furadeiras')

    price = create(:price, equipment_type: type, rental_period: 10, price: 10)

    equip_1 = create(:equipment, equipment_type: type, name: 'Furadeira 1000W')
    equip_2 = create(:equipment, equipment_type: type, name: 'Furadeira 2000W')
    equip_3 = create(:equipment, equipment_type: type, name: 'Furadeira 3000W')

    customer = create(:customer, name: 'Adriano')

    contract = build(:contract, start_date: '11/01/2017', rental_period: 10,
                                discount: 5)


    visit root_path

    click_on 'Contratos'
    click_on 'Novo Contrato'

    select(customer.name, from: 'Cliente')

    fill_in 'Prazo de locação', with: contract.rental_period
    fill_in 'Desconto', with: contract.discount
    fill_in 'Endereço de entrega', with: contract.delivery_address
    fill_in 'Responsável pela obra', with: contract.contact
    fill_in 'Forma de pagamento', with: contract.payment_method
    fill_in 'Data de início', with: contract.start_date

    check equip_1.name
    check equip_2.name

    click_on 'Emitir Contrato'

    amount = equip_1.equipment_type.current_price(contract.rental_period) + equip_2.equipment_type.current_price(contract.rental_period)


    expect(page).to have_css('h2', text: customer.name)
    expect(page).to have_content(contract.rental_period)
    expect(page).to have_content(amount)
    expect(page).to have_content(contract.discount)
    expect(page).to have_content(15)
    expect(page).to have_content(contract.delivery_address)
    expect(page).to have_content(contract.contact)
    expect(page).to have_content(contract.payment_method)
    expect(page).to have_content(contract.start_date)
    expect(page).to have_content(Time.zone.today.to_s)

    expect(page).to have_content((contract.start_date + contract.rental_period.days).to_s)

    expect(page).to have_content(equip_1.name)
    expect(page).to have_content(equip_1.serial_number)
    expect(page).to have_content(equip_1.acquisition_value)
    expect(page).to have_content(equip_1.equipment_type.name)
    expect(page).to have_content(equip_1.equipment_type.current_price(contract.rental_period))

    expect(page).to have_content(equip_2.name)
    expect(page).to have_content(equip_2.serial_number)
    expect(page).to have_content(equip_2.acquisition_value)
    expect(page).to have_content(equip_2.equipment_type.name)
    expect(page).to have_content(equip_2.equipment_type.current_price(contract.rental_period))

    expect(page).not_to have_content(equip_3.name)
    expect(page).not_to have_content(equip_3.serial_number)
    expect(page).not_to have_content(equip_3.acquisition_value)
  end

  scenario 'with no data' do

    visit new_contract_path
    click_on 'Emitir Contrato'

    expect(page).to have_content('Informação obrigatória.')

  end

  scenario 'back to index' do

    visit root_path
    click_on 'Contratos'
    click_on 'Voltar'

    expect(current_path).to eq root_path

  end

  scenario 'back to contract' do

    visit contracts_path
    click_on 'Novo Contrato'
    click_on 'Voltar'

    expect(current_path).to eq contracts_path
  end

end
