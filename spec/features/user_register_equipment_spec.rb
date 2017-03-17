require 'rails_helper'

feature 'User register equipment' do

  scenario 'successfully' do
    #setup
    equipment_type = EquipmentType.create(name: '1000W')
    equip = Equipment.new(name: 'Furadeira',
                          description: 'Furadeira Bonita',
                          serial_number: '0001',
                          acquisition_value: '5000',
                          acquisition_date: '2017-02-21',
                          shelf_life: '5 anos',
                          picture: 'img/furadeira',
                          manufacture: 'bosch',
                          vendor: 'Zezinho')

    #execução
    visit new_equipment_path

    fill_in 'Nome',                with: equip.name
    fill_in 'Descrição',           with: equip.description
    fill_in 'Número de Série',     with: equip.serial_number
    fill_in 'Valor de Aquisição',  with: equip.acquisition_value
    fill_in 'Data de Aquisição',   with: equip.acquisition_date
    fill_in 'Vida Útil',           with: equip.shelf_life
    fill_in 'Foto',                with: equip.picture
    select(equipment_type.name,    :from => 'Tipo do Equipamento')
    fill_in 'Fabricante',          with: equip.manufacture
    fill_in 'Fornecedor',          with: equip.vendor

    click_on 'Cadastrar Equipamento'

    #expectativa
    expect(page).to have_css('h1', text: equip.name)
    expect(page).to have_content equip.description
    expect(page).to have_content equip.serial_number
    expect(page).to have_content equip.acquisition_value
    expect(page).to have_content equip.acquisition_date
    expect(page).to have_content equip.shelf_life
    expect(page).to have_content equip.picture
    expect(page).to have_content equipment_type.name
    expect(page).to have_content equip.manufacture
    expect(page).to have_content equip.vendor

  end

  scenario 'and should fill all fields' do
    #execução
    visit new_equipment_path

    click_on 'Cadastrar Equipamento'
    #expectativa
    expect(page).to have_content 'Não foi possível cadastrar o equipamento'
  end

  scenario 'back to index' do
    #execução
    visit root_path

    click_on 'Equipamentos'
    click_on 'Voltar'
    #expectativa
    expect(current_path).to eq root_path
  end

end
