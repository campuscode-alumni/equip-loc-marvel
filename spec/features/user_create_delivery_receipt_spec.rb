require 'rails_helper'

feature 'User create delivery receipt' do

  scenario 'successfully' do
    #setup
    customer = Customer.create(name: 'João Almeida',
                              customer_type: 'Pessoa física',
                              document: '423.235.958-30',
                              adress: 'Av paulista 2000',
                              email: 'joaoalmeida@gmail.com',
                              contact_name: 'Jonas Souza',
                              phone_number: '11995432255',
                              state_registration: '159632')

    equipment_type = EquipmentType.create(name: 'Furadeira')

    equip = Equipment.create(name: 'Furadeira',
                          description: 'Furadeira Bonita',
                          serial_number: '0001',
                          acquisition_value: '5000',
                          acquisition_date: '2017-02-21',
                          shelf_life: '5 anos',
                          picture: 'img/furadeira',
                          equipment_type: equipment_type,
                          manufacture: 'bosch',
                          vendor: 'Zezinho')

    contract = Contract.new(
      customer: customer,
      rental_period: 3,
      amount: 30000,
      discount: 100,
      delivery_address: 'Rua Capote Valente 200',
      contact: 'Mestre Juvenal',
      payment_method: 'Pools of Cash',
      start_date: '20/02/2017')



    contract.equipment << equip
    contract.save!

    delivery_receipt = DeliveryReceipt.new(contract: contract,
                                          issue_date: Time.zone.now)

    #execução
    visit contract_path(contract)
    click_on 'Emitir Recibo de Entrega'
    #expectativa
    expect(page).to have_content('Recibo de Entrega')

    expect(page).to have_content(contract.contact)
    expect(page).to have_content(contract.customer)
    expect(page).to have_content(customer.document)
    expect(page).to have_content(contract.equipment)
    expect(page).to have_content(contract.rental_period)
    expect(page).to have_content(contract.delivery_address)
    expect(page).to have_content(contract.created_at)
    expect(page).to have_content(contract.id)

  end
end
