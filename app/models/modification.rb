class Modification < ApplicationRecord
  has_many :modification_options

  has_many :customizations
  has_many :menu_items, through: :customizations
end
