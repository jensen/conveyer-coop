require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /orders/new" do
    let(:cart) { create(:cart, user: create(:user, profile: create(:profile))) }

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

        expect(response.body).to have_selector("div", text: "123 User Address, H0H 0H0, City")
      end
    end

    context "pickup" do
      let(:store) { create(:store, restaurant: create(:restaurant, name: "Pickup Restaurant")) }
      let(:menu_category) { create(:menu_category, restaurant: store.restaurant) }
      let(:menu_item) { create(:menu_item, menu_category: menu_category) }
      let(:cart) { create(:cart, line_items: [create(:line_item, menu_item: menu_item)]) }

      it "defaults to restaurant address" do
        allow_any_instance_of(CartHelper).to receive(:current_cart) { cart }

        get new_order_path(order: { delivery: "false" })

        expect(response.body).to have_selector("div", text: "Pickup Restaurant")
        expect(response.body).to have_selector("div", text: "123 Store Address, A1A 1A1, City")
      end
    end
  end

  describe "POST /orders" do
    it "redirects a user to the order path" do
      post orders_path, params: { order: attributes_for(:order) }

      expect(response).to redirect_to(order_path(Order.last))
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
