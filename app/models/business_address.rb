class BusinessAddress < ApplicationRecord
  belongs_to :user

# Validations
validates :street, :number, :district, :city, :state, :cep, presence: true

end
