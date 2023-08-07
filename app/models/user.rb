class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  enum role: { fan: 0, admin: 1}
  validates :role, inclusion: { in: roles.keys }

  has_many :events
  has_many :bookings
  has_many :favourites
end
