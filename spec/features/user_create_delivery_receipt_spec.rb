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

    price = Price.create(rental_period: 3,
                          equipment_type: equipment_type,
                          price: '50')

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

    another_equip = Equipment.create(name: 'Betoneira',
                              description: 'Betoneiraa Bonita',
                              serial_number: '0002',
                              acquisition_value: '10000',
                              acquisition_date: '2017-02-21',
                              shelf_life: '5 anos',
                              picture: 'img/betoneira',
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



    contract.equipment << [equip, another_equip]
    contract.save!

    delivery_receipt = DeliveryReceipt.new(contract: contract,
                                          issue_date: Time.zone.now)

    #execução
    visit contract_path(contract)
    click_on 'Emitir Recibo de Entrega'
    #expectativa
    expect(page).to have_content("São Paulo, #{Time.zone.today.to_s}")
    expect(page).to have_content('Recibo de Entrega')

    expect(page).to have_content(contract.contact)
    expect(page).to have_content(contract.customer.name)
    expect(page).to have_content(customer.document)

    contract.equipment.each do |equipment|
      expect(page).to have_content(equipment.name)
      expect(page).to have_content(equipment.serial_number)
    end

    expect(page).to have_content(contract.rental_period)
    expect(page).to have_content(contract.delivery_address)
    expect(page).to have_content(contract.created_at)
    expect(page).to have_content("contrato #{contract.id}")

  end


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

    price = Price.create(rental_period: 3,
                          equipment_type: equipment_type,
                          price: '50')

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

    another_equip = Equipment.create(name: 'Betoneira',
                              description: 'Betoneiraa Bonita',
                              serial_number: '0002',
                              acquisition_value: '10000',
                              acquisition_date: '2017-02-21',
                              shelf_life: '5 anos',
                              picture: 'img/betoneira',
                              equipment_type: equipment_type,
                              manufacture: 'bosch',
                              vendor: 'Zezinho')

    contract = Contract.create(
      customer: customer,
      rental_period: 3,
      amount: 30000,
      discount: 100,
      delivery_address: 'Rua Capote Valente 200',
      contact: 'Mestre Juvenal',
      payment_method: 'Pools of Cash',
      start_date: '20/02/2017',
      equipment: [equip, another_equip])


    delivery_receipt = DeliveryReceipt.create(contract: contract,
                                              issue_date: Time.zone.now)

    #execução
    visit contract_path(contract)
    click_on 'Exibir Recibo de Entrega'

    #expectativa

    expect(page).to have_content (contract.delivery_receipt.id)
  end
end
