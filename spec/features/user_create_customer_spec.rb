require 'rails_helper'

feature 'User create customer' do
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
    visit new_customer_path

    fill_in 'Nome',                     with: customer.name
    fill_in 'Tipo de Cliente',          with: customer.customer_type
    fill_in 'CPF/CNPJ',                 with: customer.document
    fill_in 'Endereço de Faturamento',  with: customer.adress
    fill_in 'Email',                    with: customer.email
    fill_in 'Responsável',              with: customer.contact_name
    fill_in 'Telefone',                 with: customer.phone_number
    fill_in 'Inscrição Estadual',       with: customer.state_registration

    click_on 'Cadastrar Cliente'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.customer_type)
    expect(page).to have_content(customer.document)
    expect(page).to have_content(customer.adress)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.contact_name)
    expect(page).to have_content(customer.phone_number)
    expect(page).to have_content(customer.state_registration)
    expect(page).not_to have_css('strong', text: 'Vip')

  end

  scenario 'vip' do
    customer = Customer.new(name: 'João Almeida',
                            customer_type: 'Pessoa física',
                            document: '423.235.958-30',
                            adress: 'Av paulista 2000',
                            email: 'joaoalmeida@gmail.com',
                            contact_name: 'Jonas Souza',
                            phone_number: '11995432255',
                            state_registration: '159632'
                            )

    visit new_customer_path

    fill_in 'Nome',                     with: customer.name
    fill_in 'Tipo de Cliente',          with: customer.customer_type
    fill_in 'CPF/CNPJ',                 with: customer.document
    fill_in 'Endereço de Faturamento',  with: customer.adress
    fill_in 'Email',                    with: customer.email
    fill_in 'Responsável',              with: customer.contact_name
    fill_in 'Telefone',                 with: customer.phone_number
    fill_in 'Inscrição Estadual',       with: customer.state_registration
    check 'Vip'

    click_on 'Cadastrar Cliente'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.customer_type)
    expect(page).to have_content(customer.document)
    expect(page).to have_content(customer.adress)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.contact_name)
    expect(page).to have_content(customer.phone_number)
    expect(page).to have_content(customer.state_registration)
    expect(page).to have_css('strong', text: 'Vip')


  end
  scenario 'valid empty field' do

    visit new_customer_path

    click_on 'Cadastrar Cliente'

    expect(page).to have_content('Não foi possivel cadastrar cliente.
                                  Preencha os campos em branco.')
  end
end
