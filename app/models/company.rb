class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_one :feedback, dependent: :destroy

  enum status: { pending_approval: 0, approved: 5, denied: 10 }

  validates :name, :cnpj, :billing_address, :billing_email, presence: true
end
