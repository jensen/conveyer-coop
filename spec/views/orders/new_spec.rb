require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  it "renders options for deliver or pickup" do
    assign(:order, build(:order))
    assign(:cart, build(:cart))

    render

    expect(rendered).to have_selector "legend", text: "Method"

    expect(rendered).to have_selector "label", text: "Delivery"
    expect(rendered).to have_selector "input#order_delivery_true[type='radio'][name='order[delivery]'][value='true']"

    expect(rendered).to have_selector "label", text: "Pickup"
    expect(rendered).to have_selector "input#order_delivery_false[type='radio'][name='order[delivery]'][value='false']"
  end

  it "renders an address" do
    line_item = create(:line_item,
                       menu_item: create(:menu_item,
                       menu_category: create(:menu_category,
                       restaurant: create(:restaurant, name: "Restaurant"))))

    assign(:cart, create(:cart, line_items: [line_item]))
    assign(:order, build(:order, delivery: false, address: "123 Order Address"))

    render

    expect(rendered).to have_selector "legend", text: "Address"
    expect(rendered).to have_selector "h3", text: "Restaurant"
    expect(rendered).to have_selector "input#order_address[type='hidden'][name='order[address]'][value='123 Order Address']", visible: false
    expect(rendered).to have_selector "div", text: "123 Order Address"
  end

  it "renders an order summary" do
    assign(:cart, build(:cart, line_items: [
      build_stubbed(:line_item, menu_item: build_stubbed(:menu_item, name: "Item 1")),
      build_stubbed(:line_item, menu_item: build_stubbed(:menu_item, name: "Item 2"))
    ]))
    assign(:order, build(:order))

    render

    expect(rendered).to have_selector "li", text: "Item 1"
    expect(rendered).to have_selector "li", text: "Item 2"
  end
end
