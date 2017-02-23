class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.string :name
      t.string :contact_number
      t.string :email
      t.string :description

      t.timestamps
    end
  end
end
