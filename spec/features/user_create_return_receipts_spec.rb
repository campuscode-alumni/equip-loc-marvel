require 'rails_helper'

feature 'User create return_receipt' do
  scenario 'successfully' do

    customer = Customer.new(name: 'João Almeida',
                            customer_type: 'Pessoa física',
                            document: '423.235.958-30',
                            adress: 'Av paulista 2000',
                            email: 'joaoalmeida@gmail.com',
                            contact_name: 'Jonas Souza',
                            phone_number: '11995432255',
                            state_registration: '159632'
                            )

    equip = Equipment.new(name: 'Furadeira',
                          description: 'Furadeira Bonita',
                          serial_number: '0001',
                          acquisition_value: '5000',
                          acquisition_date: '2017-02-21',
                          shelf_life: '5 anos',
                          picture: 'img/furadeira',
                          equipment_type: 'alta precisão',
                          manufacture: 'bosch',
                          vendor: 'Zezinho')

    contract = Contract.create(
      client: 'Odebrecht',
      rental_period: 3,
      amount: 30000,
      discount: 100,
      delivery_address: 'Rua Capote VaClassNamelente 200',
      contact: 'Mestre Juvenal',
      payment_method: 'Pools of Cash',
      start_date: '20/02/2017'
    )

    receipts = Return_receipt.new(name: 'Nome Funcionário',
                                  cpf: 'CPF'
                                 )

    click_on 'Emitir Recibo de Devolução'

    fill_in 'Nome',                with: receipts.name
    fill_in 'Descrição',           with: receipts.cpf

    expect(to).have_content receipts.name
    expect(to).have_content receipts.cpf

    
