require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  let(:restaurant) { build(:restaurant, name: "Restaurant") }
  let(:menu_category) { build(:menu_category, restaurant: restaurant) }
  let(:menu_items) { [
    build(:menu_item, name: "Item 1", menu_category: menu_category),
    build(:menu_item, name: "Item 2", menu_category: menu_category)
  ] }
  let(:line_items) {
    menu_items.map do |menu_item|
      create(:line_item, menu_item: menu_item)
    end
  }
  let(:cart) { build(:cart, line_items: line_items) }
  let(:order) { build(:order) }

  it "renders options for deliver or pickup" do
    assign(:cart, cart)
    assign(:order, order)

    render

    expect(rendered).to have_selector "legend", text: "Method"

    expect(rendered).to have_selector "label", text: "Delivery"
    expect(rendered).to have_selector "input#order_delivery_true[type='radio'][name='order[delivery]'][value='true']"

    expect(rendered).to have_selector "label", text: "Pickup"
    expect(rendered).to have_selector "input#order_delivery_false[type='radio'][name='order[delivery]'][value='false']"
  end

  it "renders an restaurant name and address when it is for pickup" do

    assign(:cart, cart)
    assign(:order, build(:order, delivery: false, address: "123 Order Address"))

    render

    expect(rendered).to have_selector "legend", text: "Address"
    expect(rendered).to have_selector "h3", text: "Restaurant"
    expect(rendered).to have_selector "input#order_address[type='hidden'][name='order[address]'][value='123 Order Address']", visible: false
    expect(rendered).to have_selector "div", text: "123 Order Address"
  end

  it "renders only an address when there are no items from a restaurant" do
    assign(:cart, build(:cart, line_items: []))
    assign(:order, build(:order, delivery: false, address: "123 Order Address"))

    render

    expect(rendered).to have_selector "legend", text: "Address"
    expect(rendered).to have_selector "input#order_address[type='hidden'][name='order[address]'][value='123 Order Address']", visible: false
    expect(rendered).to have_selector "div", text: "123 Order Address"
  end

  it "renders an order summary" do
    assign(:cart, cart)
    assign(:order, order)

    render

    expect(rendered).to have_selector "li", text: "Item 1"
    expect(rendered).to have_selector "li", text: "Item 2"
  end
end
