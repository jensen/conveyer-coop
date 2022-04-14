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
    let!(:user) { create(:user, email: "user@test.com") }

    context "valid email and password" do
      it "returns a 200 status and redirects the user" do
        post sessions_path, params: { session: attributes_for(:user, email: "user@test.com") }

        expect(response).to redirect_to(root_path)
      end
    end

    context "password not provided" do
      it "returns a 422 status and renders the sessions/new template" do
        post sessions_path, params: { session: { email: "user@test.com" } }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end

    context "email not found" do
      it "returns a 422 status and renders the sessions/new template" do
        post sessions_path, params: { session: { email: "test@user.com" } }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end
end
