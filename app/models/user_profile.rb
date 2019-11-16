class UserProfile < ApplicationRecord
  belongs_to :user

  # Validations
  validates :birthdate, :cpf, :rg, presence: true

end