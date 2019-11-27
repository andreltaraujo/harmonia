class AddPriceCentsToContracts < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :price_cents, :integer, default: 0
  end
end
