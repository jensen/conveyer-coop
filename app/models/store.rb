class Store < ApplicationRecord
  belongs_to :restaurant
  belongs_to :city
end
