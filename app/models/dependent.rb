class Dependent < ApplicationRecord
  belongs_to :user

  # Validations
validates :name, :birthdate, :kinship, presence: true

end