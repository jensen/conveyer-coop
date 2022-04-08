require 'rails_helper'

RSpec.describe "carts/show", type: :view do
  context "empty cart" do
    let (:cart) { build(:cart, line_items: []) }

    it "renders an empty cart" do
      assign(:cart, cart)

      render

      expect(rendered).to match(/Your cart is empty/)
    end

    it "renders a disabled checkout button when the cart is empty" do
      assign(:cart, cart)

      render

      expect(rendered).to have_selector "button[disabled='disabled']", text: "Checkout"
    end
  end

  context "cart with items from a single restaurant" do
    let (:restaurant) { build(:restaurant, name: "Restaurant 1") }
    let (:menu_category) { build(:menu_category, restaurant: restaurant) }
    let (:first_menu_item) {  build(:menu_item, name: "Menu Item 1", price: 1095, menu_category: menu_category) }
    let (:second_menu_item) {  build(:menu_item, name: "Menu Item 2", price: 750, menu_category: menu_category) }
    let (:first_line_item) { build_stubbed(:line_item, quantity: 1, menu_item: first_menu_item) }
    let (:second_line_item) { build_stubbed(:line_item, quantity: 2, menu_item: second_menu_item) }
    let (:cart) { build(:cart, line_items: [first_line_item, second_line_item]) }

    it "renders a cart with menu items" do
      assign(:cart, cart)

      render

      expect(rendered).not_to have_selector "button[disabled='disabled']", text: "Checkout"

      expect(rendered).not_to match(/Your cart is empty/)

      expect(rendered).to have_selector("li div span", text: "1")
      expect(rendered).to have_selector("li h2", text: "Menu Item 1")
      expect(rendered).to have_selector("li h3", text: "$10.95")
      expect(rendered).to have_selector("li div span", text: "2")
      expect(rendered).to have_selector("li h2", text: "Menu Item 2")
      expect(rendered).to have_selector("li h3", text: "$15.00")
    end
  end
end
