require 'rails_helper'

feature 'user creates equipment type' do

  scenario 'successfully' do

    equipment_type = EquipmentType.create(name: 'Furadeira 1000W')

    visit root_path
    click_on 'Cadastrar Tipo de Equipamento'
    fill_in 'Nome', with: equipment_type.name
    click_on 'Cadastrar'

    expect(page).to have_content equipment_type.name

  end

  scenario 'and should put a name' do

    visit root_path
    click_on 'Cadastrar Tipo de Equipamento'
    click_on 'Cadastrar'

    expect(page).to have_content 'Não foi possível cadastrar tipo de equipamento.'

  end

end
