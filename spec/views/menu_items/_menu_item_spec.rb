require 'rails_helper'

RSpec.describe "menu_items/_menu_item.html.erb", type: :view do
  it "renders a menu item" do
    item = build(:menu_item, name: "Item", description: "Description", price: 1099)

    render partial: "menu_items/menu_item", locals: { menu_item: item }

    expect(rendered).to match(/Item/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/\$10.99/)
  end
end
