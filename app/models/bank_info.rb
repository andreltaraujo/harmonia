class BankInfo < ApplicationRecord
  belongs_to :user

# Validations
validates :bank_name, :bank_number, :agency_number, :account_number, :debit_date, presence: true
end