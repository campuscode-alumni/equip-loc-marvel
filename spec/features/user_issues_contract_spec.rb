require 'rails_helper'

feature 'User issues contract' do

  scenario 'successfully' do


    type1 = create(:equipment_type, name: '1000W')
    type2 = create(:equipment_type, name: '2000W')
    type3 = create(:equipment_type, name: '3000W')


    equips_type1 = create_list(:equipment, 1, equipment_type: type1)
    equips_type2 = create_list(:equipment, 2, equipment_type: type2)
    equips_type3 = create_list(:equipment, 1, equipment_type: type3)

    customer = create(:customer)

    contract = build(:contract)

    visit root_path

    click_on 'Novo Contrato'

    select(customer.name, :from => 'Cliente')

    fill_in 'Prazo de locação', with: contract.rental_period
    fill_in 'Desconto', with: contract.discount
    fill_in 'Endereço de entrega', with: contract.delivery_address
    fill_in 'Responsável pela obra', with: contract.contact
    fill_in 'Forma de pagamento', with: contract.payment_method
    fill_in 'Data de início', with: contract.start_date

    check equips_type1.first.name
    check equips_type2.first.name
    check equips_type2.second.name

    click_on 'Emitir Contrato'

    amount = equips_type1.first.equipment_type.price.price + equips_type2.first.equipment_type.price.price + equips_type2.second.equipment_type.price.price

    expect(page).to have_css('h2', text: customer.name)
    expect(page).to have_content(contract.rental_period)
    expect(page).to have_content(amount)
    expect(page).to have_content(contract.discount)
    expect(page).to have_content((amount - contract.discount).round(2))
    expect(page).to have_content(contract.delivery_address)
    expect(page).to have_content(contract.contact)
    expect(page).to have_content(contract.payment_method)
    expect(page).to have_content(contract.start_date)
    expect(page).to have_content(Time.zone.today.to_s)
    expect(page).to have_content((contract.start_date + contract.rental_period.days).to_s)

    expect(page).to have_content(equips_type1.first.name)
    expect(page).to have_content(equips_type1.first.serial_number)
    expect(page).to have_content(equips_type1.first.acquisition_value)
    expect(page).to have_content(equips_type1.first.equipment_type.name)
    expect(page).to have_content(equips_type1.first.equipment_type.price.price)

    expect(page).to have_content(equips_type2.first.name)
    expect(page).to have_content(equips_type2.first.serial_number)
    expect(page).to have_content(equips_type2.first.acquisition_value)
    expect(page).to have_content(equips_type2.first.equipment_type.name)
    expect(page).to have_content(equips_type2.first.equipment_type.price.price)

    expect(page).to have_content(equips_type2.second.name)
    expect(page).to have_content(equips_type2.second.serial_number)
    expect(page).to have_content(equips_type2.second.acquisition_value)
    expect(page).to have_content(equips_type2.second.equipment_type.name)
    expect(page).to have_content(equips_type2.second.equipment_type.price.price)

    expect(page).not_to have_content(equips_type3.first.name)
    expect(page).not_to have_content(equips_type3.first.serial_number)
    expect(page).not_to have_content(equips_type3.first.acquisition_value)
    expect(page).not_to have_content(equips_type3.first.equipment_type.name)
    expect(page).not_to have_content(equips_type3.first.equipment_type.price.price)

  end

  scenario 'with no data' do

    visit root_path
    click_on 'Novo Contrato'
    click_on 'Emitir Contrato'

    expect(page).to have_content('Informação obrigatória.')

  end

end
