require 'rails_helper'

RSpec.describe "Carts", type: :request do
  describe "GET /carts/:id" do
    let(:cart) { create(:cart, line_items: []) }

    it "returns a 200 with the carts/show template" do
      get cart_path(cart)

      expect(response).to have_http_status(:ok)
      expect(response).to have_rendered(:show)
    end
  end
end
