class Order < ApplicationRecord
  belongs_to :contract
  belongs_to :user

   # Statuses
   enum status: [:requested, :waiting, :analysing, :paid, :available, :dispute, :returned, :canceled, :debited, :temporary_retention]
  
end
