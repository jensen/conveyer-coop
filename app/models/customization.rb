class Customization < ApplicationRecord
  belongs_to :menu_item
  belongs_to :modification
end
