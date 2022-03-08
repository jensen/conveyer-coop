require 'rails_helper'

RSpec.describe "Cuisines", type: :request do
  describe "GET /" do
    fixtures :cuisines

    it "returns a 200 with the cuisines/index template" do
      get root_path

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end
  end
end
