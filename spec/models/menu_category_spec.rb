require 'rails_helper'

RSpec.describe MenuCategory, type: :model do
  it "is valid with valid attributes" do
    category = build(:menu_category)

    expect(category).to be_valid
  end
end
