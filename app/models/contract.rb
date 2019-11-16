class Contract < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :representative, optional: true, counter_cache: true

  # Money_Rails
  monetize :price_cents
  
  EVENTS = {
    new_contract: "New Contract"
  }
  
  #Statuses
  enum status: [:available, :processing, :paid, :active, :defaulting, :suspended, :inactive ]

  #Validations
  # ?
  
  def self.set_number(event)
    number = Contract.last.number.to_i
    new_number = number += 1
    new_contract = Contract.new(event: event, number: new_number, contract_date: Date.today, user: User.last)
    new_contract.save
  end
end
