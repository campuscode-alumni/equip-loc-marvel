require 'rails_helper'

feature 'User issues contract' do

  scenario 'successfully' do

    equip1 = Equipment.create(name: 'Furadeira',
                          description: 'Furadeira Bonita',
                          serial_number: '0001',
                          acquisition_value: '5000',
                          acquisition_date: '2017-02-21',
                          shelf_life: '5 anos',
                          picture: 'img/furadeira',
                          equipment_type: 'alta precisão',
                          manufacture: 'bosch',
                          vendor: 'Zezinho')

    equip2 = Equipment.create(name: 'Betoneira',
                          description: 'Betoneira Super Gigante',
                          serial_number: '8888',
                          acquisition_value: '10000',
                          acquisition_date: '1984-05-14',
                          shelf_life: '48 anos',
                          picture: 'img/betoneira',
                          equipment_type: 'Altérrima Performance',
                          manufacture: 'DeWalt',
                          vendor: 'Tio Sam')

    equip3 = Equipment.create(name: 'Escavadeira',
                          description: 'Cava buraco até a China',
                          serial_number: '1234',
                          acquisition_value: '986.14',
                          acquisition_date: '2016-04-01',
                          shelf_life: '13 anos',
                          picture: 'img/escavadeira',
                          equipment_type: 'Mágico',
                          manufacture: 'Caterpillar',
                          vendor: 'Mappin')

    contract = Contract.create(
      client: 'Odebrecht',
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
    fill_in 'Prazo de locação', with: contract.rental_period
    fill_in 'Valor de locação', with: contract.amount
    fill_in 'Desconto', with: contract.discount
    fill_in 'Endereço de entrega', with: contract.delivery_address
    fill_in 'Responsável pela obra', with: contract.contact
    fill_in 'Forma de pagamento', with: contract.payment_method
    fill_in 'Data de início', with: contract.start_date

    check equip1.name
    check equip2.name

    click_on 'Emitir Contrato'

    expect(page).to have_css('h2', text: contract.client)
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
    expect(page).to have_content(equip1.name)
    expect(page).to have_content(equip1.acquisition_value)
    expect(page).to have_content(equip1.serial_number)
    expect(page).to have_content(equip2.name)
    expect(page).to have_content(equip2.acquisition_value)
    expect(page).to have_content(equip2.serial_number)
    expect(page).not_to have_content(equip3.name)
    expect(page).not_to have_content(equip3.acquisition_value)
    expect(page).not_to have_content(equip3.serial_number)

  end

  scenario 'with no data' do

    visit root_path
    click_on 'Novo Contrato'
    click_on 'Emitir Contrato'

    expect(page).to have_content('Informação obrigatória.')

  end

end
