require 'rails_helper'

feature 'User Register Price' do

  scenario 'successfully' do
    #setup
    equipment_type = EquipmentType.create(name: 'Betoneiras')
    price = Price.new(rental_period: '1',
                      equipment_type: equipment_type,
                      price: '1000')
    #execução
    visit new_price_path

    fill_in 'Prazo De Locação',    with: price.rental_period
    select equipment_type.name, from: 'Tipo do Equipamento'
    fill_in 'Preço',               with: price.price

    click_on 'Cadastrar Preço'

    #expectativa
    expect(page).to have_content price.rental_period
    expect(page).to have_content price.equipment_type.name
    expect(page).to have_content price.price
  end

  scenario 'and should fill all fields' do
    #execução
    visit new_price_path

    click_on 'Cadastrar Preço'

    #expectativa
    expect(page).to have_content 'Não foi possível cadastrar o preço'
  end

end
