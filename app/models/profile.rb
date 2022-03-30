class Profile < ApplicationRecord
  belongs_to :city
  belongs_to :user

  validates_presence_of :address
  validates_presence_of :postal_code
end
