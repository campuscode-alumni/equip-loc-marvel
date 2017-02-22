class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :customer_type
      t.string :document
      t.string :adress
      t.string :email
      t.string :contact_name
      t.string :phone_number
      t.string :state_registration

      t.timestamps
    end
  end
end
