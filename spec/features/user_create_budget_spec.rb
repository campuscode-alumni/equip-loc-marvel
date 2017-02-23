require 'rails_helper'


feature 'user create budget'  do
  scenario 'successfully' do

    budget = Budget.new(name: 'Sandro Martins',
                        contact_number: '11985745566',
                        email: 'sandrom@hotmail.com',
                        description: 'Gostaria de saber a disponilibilidade...'
                        )

    visit root_path

    click_on 'Solicitar Orçamento'

    fill_in 'Nome', with: budget.name
    fill_in 'Telefone', with: budget.contact_number
    fill_in 'Email', with: budget.email
    fill_in 'Descrição', with: budget.description

    click_on 'Enviar Orçamento'

    expect(page).to have_content('Agradecemos seu interesse em breve entraremos em contato.')
  end

  scenario 'valid field empty' do

    budget = Budget.new(name: 'Sandro Martins',
                        contact_number: '11985745566',
                        email: 'sandrom@hotmail.com',
                        description: 'Gostaria de saber a disponilibilidade...'
                        )

    visit root_path

    click_on 'Solicitar Orçamento'

    click_on 'Enviar Orçamento'

    expect(page).to have_content('Preencha os campos em brancos')
  end
end
