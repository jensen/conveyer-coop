class User < ApplicationRecord
  has_secure_password

  has_one :profile

  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true

  before_save { self.email = email.downcase }

  def address
    "#{profile.address}, #{profile.postal_code}, #{profile.city.name}"
  end
end
