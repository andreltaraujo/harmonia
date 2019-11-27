class Representative < ApplicationRecord
  has_many :contracts

# Virtual Attributes
  def full_name
    [self.first_name, self.last_name].join(' ')
  end
end
