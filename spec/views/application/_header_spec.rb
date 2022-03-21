require 'rails_helper'

RSpec.describe "application/_header.html.erb", type: :view do
  context "user is not logged in" do
    it "renders the header with a sign in link" do
      render partial: "application/header"

      expect(rendered).to have_selector("a", text: "Sign In")
    end

    it "renders the header with a sign up link" do
      render partial: "application/header"

      expect(rendered).to have_selector("a", text: "Sign Up")
    end
  end

  context "user is logged in" do
    it "renders the header with a cart button when cart exists" do
      user = create(:user)
      session[:user_id] = user.id

      allow(view).to receive(:current_cart) { build_stubbed(:cart, user: user) }

      render partial: "application/header"

      expect(rendered).to have_selector("a[data-test-id=cart]", text: "0")
    end

    it "renders the header without a cart button when no cart" do
      allow(view).to receive(:current_cart) { nil }

      user = create(:user)
      session[:user_id] = user.id

      render partial: "application/header"

      expect(rendered).not_to have_selector("a[data-test-id=cart]", text: "0")
    end
  end
end
