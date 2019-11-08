class CreateBankInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_infos do |t|
      t.string :bank_name
      t.string :bank_number
      t.string :agency_number
      t.string :account_number
      t.date :debit_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
