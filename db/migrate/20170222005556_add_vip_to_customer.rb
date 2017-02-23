class AddVipToCustomer < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :vip, :boolean
  end
end
