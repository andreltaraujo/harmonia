class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.string :event
      t.string :number
      t.integer :status, default: 0
      t.date :contract_date
      t.references :user, foreign_key: true
      t.references :representative, foreign_key: true

      t.timestamps
    end
  end
end
