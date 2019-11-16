class AddContractsCountToRepresentatives < ActiveRecord::Migration[5.2]
  def change
    add_column :representatives, :contracts_count, :integer
  end
end
