require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  let(:menu_item) { build(:menu_item) }

  it "is valid with valid attributes" do
    expect(menu_item).to be_valid
  end
end
