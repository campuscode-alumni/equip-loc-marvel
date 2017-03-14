class AddFinishedToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :finished, :datetime
  end
end
