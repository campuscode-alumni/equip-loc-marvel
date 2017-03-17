require 'rails_helper'


feature  'Active contract block equipment' do
  scenario 'successfully ' do

    type1 = create(:equipment_type)
    price1 = create(:price, equipment_type: type1, rental_period: '1')
    equip1 = create(:equipment, equipment_type: type1, name: 'Furadeira 1000W')
    equip2 = create(:equipment, equipment_type: type1, name: 'Britadeira 2000W')
    customer = create(:customer)
    contract = create(:contract, equipment: [equip1], customer: customer, discount: 0)

    visit new_contract_path

    expect(page).to have_content(equip2.name)
    expect(page).not_to have_content(equip1.name)

  end

end
