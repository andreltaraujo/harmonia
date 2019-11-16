class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile
  has_one :home_address
  has_one :business_address
  has_one :bank_info
  has_one :contract

  has_many :phones
  has_many :dependents  

  accepts_nested_attributes_for :user_profile, :home_address, :business_address, :bank_info, :contract,
                                :phones, :dependents,
                                reject_if: :all_blank
  
  # Callback
  after_create :set_contract

  # Validations
  validates :first_name, :last_name, presence: true, length: {minimum: 3}

  # Virtual Attributes
  def full_name
    [self.first_name, self.last_name].join(' ')
  end

  def set_contract
    Contract.set_number(Contract::EVENTS[:new_contract])
  end
end
