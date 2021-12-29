class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company, optional: true

  validates :company, presence: true, on: :has_company?
  validate :email_domain

  private

  def email_domain
    domain = email.split('@').last
    error_msg = 'is of an invalid personal domain'
    return errors.add(:email, error_msg) if domain.match(email_list)
  end

  def email_list
    'gmail.com' || 'hotmail.com' || 'yahoo.com'
  end
end
