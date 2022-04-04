require 'rails_helper'

RSpec.describe "Cuisines", type: :request do
  describe "GET /cuisines/:slug" do
    let!(:cuisine) { create(:cuisine, name: "Chicken", slug: "chicken", restaurants: [
      create(:restaurant, images: [
        create(:image)
      ])
    ]) }

    it "returns a 200 status with the cuisines/show template" do
      get cuisine_path(slug: "chicken")

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
    end
  end

end
