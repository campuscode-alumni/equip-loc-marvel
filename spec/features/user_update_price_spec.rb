require 'rails_helper'

feature 'User update price' do

  scenario 'successfully' do
    #setup
    equipment_type = create(:equipment_type, name: 'Furadeiras')
    equipment = create(:equipment, equipment_type: equipment_type)

    old_price = Price.create(rental_period: 3,
                      equipment_type: equipment_type,
                      price: 1000)
    current_price = Price.create(rental_period: 3,
                       equipment_type: equipment_type,
                       price: 2000)

    #execução

  end
end
