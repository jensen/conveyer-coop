require 'rails_helper'

# This spec contains examples for different ways to mock sessions.
#
# Ideally we write these integration tests with the goal of matching how
# the user interacts with the software. In some cases it might make
# it easier to write tests by mocking some behaviour.

RSpec.describe "LineItems", type: :request do
  describe "POST /menu_items/:menu_item_id/line_items" do
    let(:user) { create(:user, email: "user@test.com") }
    let(:cart) { create(:cart, user: user) }
    let(:restaurant) { create(:restaurant, name: "Restaurant", slug: "restaurant", images: [create(:image)]) }
    let(:menu_category) { create(:menu_category, restaurant: restaurant) }
    let(:menu_item) { create(:menu_item, menu_category: menu_category, price: 550) }

    context "user is not authenticated" do
      it "returns an unauthorized status code" do
        post menu_item_line_items_path(menu_item), params: { line_item: { quantity: 1 } }

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "user is authenticated" do
      before(:each) {
        set_session(user_id: user.id, cart_id: cart.id)
      }

      it "creates a new line item with valid params" do
        post menu_item_line_items_path(menu_item), params: { line_item: { quantity: 1 } }

        expect(response).to redirect_to(restaurant_path(slug: "restaurant"))
      end

      it "renders the form again without valid params" do
        post menu_item_line_items_path(menu_item), params: { line_item: { quantity: 0 } }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end

      it "renders the line item with a quantity of five and a total price" do
        post menu_item_line_items_path(menu_item), params: { line_item: { quantity: 5 } }

        expect(response).to redirect_to(restaurant_path(slug: "restaurant"))

        follow_redirect!

        get cart_path(cart)

        expect(response.body).to have_selector "ul", text: "5"
        expect(response.body).to have_selector "ul", text: "$27.50"

      end
    end
  end

  describe "GET /menu_items/:menu_item_id/line_items/new" do
    let(:cart) { create(:cart) }
    let(:menu_item) { create(:menu_item) }

    it "renders the new line item form" do
      allow_any_instance_of(CartHelper).to receive(:current_cart) { cart }

      get new_menu_item_line_item_path(menu_item)

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:new)
    end
  end

  describe "DELETE /line_items/:id" do
    let(:user) { create(:user) }
    let(:restaurant) { create(:restaurant, name: "Restaurant", slug: "restaurant") }
    let(:menu_category) { create(:menu_category, restaurant: restaurant) }
    let(:menu_item) { create(:menu_item, menu_category: menu_category) }
    let(:line_item) { create(:line_item, menu_item: menu_item) }

    it "redirects after destroying the line item record" do
      allow_any_instance_of(SessionsHelper).to receive(:current_user) { user }

      delete line_item_path(line_item)

      expect(response).to redirect_to(restaurant_path(slug: "restaurant"))
    end
  end
end
