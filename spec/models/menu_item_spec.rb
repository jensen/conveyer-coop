require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it "is valid with valid attributes" do
    item = build(:menu_item)

    expect(item).to be_valid
  end
end
