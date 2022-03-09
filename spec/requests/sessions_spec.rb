require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it "returns a 200 status with the sessions/new template" do
      get login_path

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:new)
    end
  end

  describe "DELETE /logout" do
    it "returns a 200 status and redirects to the root" do
      delete logout_path

      expect(response).to redirect_to(root_path)
    end
  end

  describe "POST /sessions" do
    before :each do
      @user = User.create(email: "test@user.com", password: "abc", password_confirmation: "abc")
    end

    it "returns a 200 status and redirects the user" do
      post sessions_path, params: { session: { email: "test@user.com", password: "abc" }}

      expect(response).to redirect_to(root_path)
    end

    it "returns a 422 status and renders the sessions/new template" do
      post sessions_path, params: { session: { email: "test@user.com"}}

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:new)
    end
  end
end
