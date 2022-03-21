require 'rails_helper'

RSpec.describe "line_items/new", type: :view do

  it "renders a menu item" do
    menu_item = build_stubbed(:menu_item, name: "Menu Item", description: "Description.")
    line_item = build_stubbed(:line_item, menu_item: menu_item)

    assign(:line_item, line_item)

    render

    expect(rendered).to match(/Menu Item/)
    expect(rendered).to match(/Description./)
  end

  it "renders a menu item with customizations" do
    menu_item = build_stubbed(:menu_item_with_modifications, name: "Menu Item", description: "Description.")
    line_item = build(:line_item, menu_item: menu_item)

    assign(:line_item, line_item)

    render

    expect(rendered).to match(/Modification 1/)
    expect(rendered).to match(/Modification Option 1/)
  end

  it "renders an add to cart button" do
    menu_item = build_stubbed(:menu_item, price: 775)
    line_item = build(:line_item, menu_item: menu_item)

    assign(:line_item, line_item)

    render

    expect(rendered).to match(/Add to cart - \$7.75/)
  end
end
