class Company < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :name, :cnpj, :billing_address, :billing_email, presence: true
end
