require 'rails_helper'

feature 'User sets contract as finished' do

  scenario 'sucessfully' do

    type1 = create(:equipment_type)
    price1 = create(:price, equipment_type: type1, rental_period: '1')
    equip1 = create(:equipment, equipment_type: type1)
    customer = create(:customer)
    contract = create(:contract, equipment: [equip1], customer: customer)

    # Index do contrato nao esta pronta, vai direto ao contrato
    visit contract_path(contract.id)
    click_on 'Finalizar Contrato'

    expect(page).to have_content("Finalizado: #{Time.zone.today.to_s}")

  end

end
