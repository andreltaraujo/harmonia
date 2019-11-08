class Contract < ApplicationRecord
  belongs_to :user
  #belongs_to :representative

  #Statuses
  enum status: [:available, :processing, :paid, :active, :defaulting, :suspended, :inactive ]

end
