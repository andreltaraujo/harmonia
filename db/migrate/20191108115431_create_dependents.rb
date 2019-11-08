class CreateDependents < ActiveRecord::Migration[5.2]
  def change
    create_table :dependents do |t|
      t.string :name
      t.date :birthdate
      t.string :kinship
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
