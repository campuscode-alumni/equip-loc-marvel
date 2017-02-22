require 'rails_helper'

feature 'User issues contract' do

  scenario 'successfully' do
    contract = Contract.new(
      client: 'Odebrecht',
      equipment: 'Furadeira 2000, Betoneira Pacandona',
      rental_period: 3,
      amount: 30000,
      discount: 100,
      delivery_address: 'Rua Capote Valente 200',
      contact: 'Mestre Juvenal',
      payment_method: 'Pools of Cash',
      start_date: '20/02/2017'
    )

    visit root_path

    click_on 'Novo Contrato'

    fill_in 'Cliente', with: contract.client
    fill_in 'Equipamentos', with: contract.equipment
    fill_in 'Prazo de locação', with: contract.rental_period
    fill_in 'Valor de locação', with: contract.amount
    fill_in 'Desconto', with: contract.discount
    fill_in 'Endereço de entrega', with: contract.delivery_address
    fill_in 'Responsável pela obra', with: contract.contact
    fill_in 'Forma de pagamento', with: contract.payment_method
    fill_in 'Data de início', with: contract.start_date

    click_on 'Emitir Contrato'

    expect(page).to have_css('h2', text: contract.client)
    expect(page).to have_content(contract.equipment)
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
  end

  scenario 'with no data' do

    visit root_path
    click_on 'Novo Contrato'
    click_on 'Emitir Contrato'

    expect(page).to have_content('Informação obrigatória.')

  end

end
