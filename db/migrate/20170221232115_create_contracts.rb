class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.string :client
      t.string :equipment
      t.integer :rental_period
      t.float :amount
      t.float :discount
      t.float :total_amount
      t.string :delivery_address
      t.string :contact
      t.string :payment_method
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
