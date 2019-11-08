class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :cpf
      t.string :rg
      t.date :birthdate
      t.string :mar_status
      t.string :secretary
      t.string :entity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
