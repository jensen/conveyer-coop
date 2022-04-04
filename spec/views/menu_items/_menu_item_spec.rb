require 'rails_helper'

RSpec.describe "menu_items/_menu_item.html.erb", type: :view do
  let(:menu_item) { build(:menu_item, name: "Item", description: "Description", price: 1099) }
  it "renders a menu item" do
    render partial: "menu_items/menu_item", locals: { menu_item: menu_item }

    expect(rendered).to match(/Item/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/\$10.99/)
  end
end
