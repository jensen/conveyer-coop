require 'rails_helper'

RSpec.describe "Cuisines", type: :request do
  describe "GET /" do
    it "returns a 200 with the cuisines/index template" do
      create(:cuisine)

      get root_path

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end
  end
end
