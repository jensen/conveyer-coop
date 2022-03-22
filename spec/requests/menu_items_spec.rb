require 'rails_helper'

RSpec.describe "MenuItems", type: :request do
  describe "GET /menu_items/:id" do
    it "returns a 200 with the menu_items/show template" do
      menu_item = create(:menu_item)

      get menu_item_url(menu_item)

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
    end
  end
end
