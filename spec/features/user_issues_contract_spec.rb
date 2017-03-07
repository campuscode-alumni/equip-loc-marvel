require 'rails_helper'

feature 'User issues contract' do

  scenario 'successfully' do

    type1 = create(:equipment_type, name: '1000W')
    type2 = create(:equipment_type, name: '2000W')

    equips_type1 = create_list(:equipment, 5, equipment_type: type1)
    equips_type2 = create_list(:equipment, 5, equipment_type: type2)

    customer = create(:customer)

    contract = Contract.create(
      rental_period: 3,
      discount: 100,
      amount: 3000,
      delivery_address: 'Rua Capote Valente 200',
      contact: 'Mestre Juvenal',
      payment_method: 'Pools of Cash',
      start_date: '20/02/2017'
    )

    visit root_path

    click_on 'Novo Contrato'

    select(customer.name, :from => 'Cliente')
    fill_in 'Prazo de locação', with: contract.rental_period
    fill_in 'Valor de locação', with: contract.amount
    fill_in 'Desconto', with: contract.discount
    fill_in 'Endereço de entrega', with: contract.delivery_address
    fill_in 'Responsável pela obra', with: contract.contact
    fill_in 'Forma de pagamento', with: contract.payment_method
    fill_in 'Data de início', with: contract.start_date

    check equips.first.name
    check equips.second.name

    click_on 'Emitir Contrato'

    expect(page).to have_css('h2', text: customer.name)
    expect(page).to have_content(contract.rental_period)
    expect(page).to have_content(contract.amount)
    expect(page).to have_content(contract.discount)
    expect(page).to have_content(contract.amount - contract.discount)
    expect(page).to have_content(contract.delivery_address)
    expect(page).to have_content(contract.contact)
    expect(page).to have_content(contract.payment_method)
    expect(page).to have_content(contract.start_date)
    expect(page).to have_content(Time.zone.today.to_s)
    expect(page).to have_content((contract.start_date + contract.rental_period.days).to_s)
    expect(page).to have_content(equips.first.name)
    expect(page).to have_content(equips.first.acquisition_value)
    expect(page).to have_content(equips.first.serial_number)
    expect(page).to have_content(equips.second.name)
    expect(page).to have_content(equips.second.acquisition_value)
    expect(page).to have_content(equips.second.serial_number)
    expect(page).not_to have_content(equips.last.name)
    expect(page).not_to have_content(equips.last.acquisition_value)
    expect(page).not_to have_content(equips.last.serial_number)

  end

  scenario 'with no data' do

    visit root_path
    click_on 'Novo Contrato'
    click_on 'Emitir Contrato'

    expect(page).to have_content('Informação obrigatória.')

  end

end
