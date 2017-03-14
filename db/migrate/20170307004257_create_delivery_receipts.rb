class CreateDeliveryReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_receipts do |t|
      t.references :contract, foreign_key: true
      t.datetime :issue_date

      t.timestamps
    end
  end
end
