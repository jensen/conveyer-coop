require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /orders/new" do
    let(:profile) { build(:profile,
                          address: "123 User Address",
                          postal_code: "A1A 1A1",
                          city: build(:city, name: "City")) }
    let(:user) { build(:user, profile: profile) }
    let(:cart) { build(:cart, user: user) }

    it "returns a 200 with the orders/new template" do
      allow_any_instance_of(CartHelper).to receive(:current_cart) { cart }

      get new_order_path

      expect(response).to have_http_status(:ok)
      expect(response).to have_rendered(:new)
    end

    context "delivery" do
      it "defaults to user address" do
        allow_any_instance_of(CartHelper).to receive(:current_cart) { cart }

        get new_order_path

        expect(response.body).to have_selector("div", text: "123 User Address, A1A 1A1, City")
      end
    end

    context "pickup" do
      let(:store) { create(:store,
                           address: "123 Store Address",
                           postal_code: "A1A 1A1",
                           city: build(:city, name: "City"),
                           restaurant: build(:restaurant, name: "Pickup Restaurant")) }
      let(:menu_category) { build(:menu_category, restaurant: store.restaurant) }
      let(:menu_item) { build(:menu_item, menu_category: menu_category) }
      let(:cart) { build(:cart, line_items: [create(:line_item, menu_item: menu_item)]) }

      it "defaults to restaurant address" do
        allow_any_instance_of(CartHelper).to receive(:current_cart) { cart }

        get new_order_path(order: { delivery: "false" })

        expect(response.body).to have_selector("div", text: "Pickup Restaurant")
        expect(response.body).to have_selector("div", text: "123 Store Address, A1A 1A1, City")
      end
    end
  end

  describe "POST /orders" do
    context "completing an order" do
      let(:menu_category) { build(:menu_category, restaurant: build(:restaurant)) }
      let(:line_items) { [
        build(:line_item, menu_item: build(:menu_item, name: "First Item", menu_category: menu_category)),
        build(:line_item, menu_item: build(:menu_item, name: "Second Item", menu_category: menu_category))
      ] }
      let(:cart) {
        build(:cart, line_items: line_items)
      }

      it "redirects a user to the order path" do
        allow_any_instance_of(CartHelper).to receive(:current_cart) { cart }

        post orders_path, params: { order: attributes_for(:order) }

        expect(response).to redirect_to(order_path(Order.last))

        expect(Order.last.line_items.count).to eq 2
      end
    end

    it "returns a 429 with the orders/new template" do
      post orders_path, params: { order: attributes_for(:order, :invalid) }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to have_rendered(:new)
    end
  end

  describe "GET /orders/:id" do
    let (:order) { create(:order) }

    it "returns a 200 with the orders/show template" do
      get order_path(order)

      expect(response).to have_http_status(:ok)
      expect(response).to have_rendered(:show)
    end
  end
end
