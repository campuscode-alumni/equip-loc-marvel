class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.integer :rental_period
      t.references :equipment_type, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end
