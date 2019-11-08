class CreateBusinessAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :business_addresses do |t|
      t.string :street
      t.string :number
      t.string :district
      t.string :city
      t.string :state
      t.string :cep
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
