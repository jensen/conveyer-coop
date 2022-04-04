require 'rails_helper'

RSpec.describe "LineItems", type: :request do
  describe "POST /menu_items/:menu_item_id/line_items" do
    let(:cart) { create(:cart) }
    let(:restaurant) { create(:restaurant, name: "Restaurant", slug: "restaurant") }
    let(:menu_category) { create(:menu_category, restaurant: restaurant) }
    let(:menu_item) { create(:menu_item, menu_category: menu_category) }

    it "creates a new line item with valid params" do
      allow_any_instance_of(CartHelper).to receive(:current_cart) { cart }

      post menu_item_line_items_path(menu_item), params: { line_item: { quantity: 1 } }

      expect(response).to redirect_to(restaurant_path(slug: "restaurant"))
    end

    it "renders the form again without valid params" do
      allow_any_instance_of(CartHelper).to receive(:current_cart) { cart }

      post menu_item_line_items_path(menu_item), params: { line_item: { quantity: 0 } }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:new)
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
    let(:restaurant) { create(:restaurant, name: "Restaurant", slug: "restaurant") }
    let(:menu_category) { create(:menu_category, restaurant: restaurant) }
    let(:menu_item) { create(:menu_item, menu_category: menu_category) }
    let(:line_item) { create(:line_item, menu_item: menu_item) }

    it "redirects after destroying the line item record" do
      delete line_item_path(line_item)

      expect(response).to redirect_to(restaurant_path(slug: "restaurant" ))
    end
  end
end
