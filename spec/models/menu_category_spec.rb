require 'rails_helper'

RSpec.describe MenuCategory, type: :model do
  let(:menu_category) { build(:menu_category) }

  it "is valid with valid attributes" do
    expect(menu_category).to be_valid
  end
end
