require 'rails_helper'

RSpec.describe "Cuisines", type: :request do
  describe "GET /register" do
    it "returns a 200 status with the users/new template" do
      get register_path

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:new)
    end
  end

  describe "POST /users" do
    it "should create a new user" do
      expect {
        post users_path, params: { user: { email: "test@user.com", password: "abc", password_confirmation: "abc" } }
      }.to change(User, :count).by(1)
    end

    it "should redirect to root when created successfully" do
      post users_path, params: { user: { email: "test@user.com", password: "abc", password_confirmation: "abc" } }

      expect(response).to redirect_to(root_path)
    end

    it "should render the form with status 422 when invalid" do
      post users_path, params: { user: { email: "" } }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:new)
    end
  end
end
