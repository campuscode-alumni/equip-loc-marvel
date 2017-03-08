require 'rails_helper'

feature 'User create return receipt' do
  scenario 'successfully' do

    customer = Customer.create(name: 'João Almeida',
                            customer_type: 'Pessoa física',
                            document: '423.235.958-30',
                            adress: 'Av paulista 2000',
                            email: 'joaoalmeida@gmail.com',
                            contact_name: 'Jonas Souza',
                            phone_number: '11995432255',
                            state_registration: '159632'
                            )
    equipment_type = EquipmentType.create(name: 'Empilhadeira')

    price = Price.create(equipment_type: equipment_type, rental_period: 10, price: 10)

    equip = Equipment.create(name: 'Empilhadeira',
                          description: 'Empilhadeira',
                          serial_number: '0001',
                          acquisition_value: '5000',
                          acquisition_date: '2017-02-21',
                          shelf_life: '5 anos',
                          picture: 'img/furadeira',
                          equipment_type: equipment_type,
                          manufacture: 'bosch',
                          vendor: 'Zezinho')

    contract = Contract.create(
      customer: customer,
      rental_period: 3,
      amount: 30000,
      discount: 0,
      delivery_address: 'Rua Capote VaClassNamelente 200',
      contact: 'Mestre Juvenal',
      payment_method: 'Pools of Cash',
      start_date: '20/02/2017'
    )

    receipt = ReturnReceipt.new(name: 'Nome Funcionário',
                                  cpf: '1234567895'
                                  )
    contract.equipment << equip
    contract.save!

    visit contract_path(contract)
    click_on 'Emitir Recibo de Devolução'

    fill_in 'Nome do Funcionário',               with: receipt.name
    fill_in 'CPF do Funcionário',                with: receipt.cpf

    click_on 'Imprimir Recibo de Devolução'

    expect(page).to have_content receipt.name
    expect(page).to have_content receipt.cpf
    expect(page).to have_content equip.name
    expect(page).to have_content equip.serial_number
    expect(page).to have_content customer.name
    expect(page).to have_content customer.document
    expect(page).to have_content contract.rental_period

    end
  end
