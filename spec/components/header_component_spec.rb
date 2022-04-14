# frozen_string_literal: true

require "rails_helper"

RSpec.describe HeaderComponent, type: :component do
  context "user is not authenticated " do
    context "while visiting non auth page" do
      it "renders the sign in and sign up buttons" do
        allow_any_instance_of(ActionView::Helpers::UrlHelper).to receive(:current_page?).with(
          "/register"
        ) { false }

        allow_any_instance_of(ActionView::Helpers::UrlHelper).to receive(:current_page?).with(
          "/login"
        ) { false }

        render_inline(described_class.new)

        expect(rendered_component).to have_link "Sign In"
        expect(rendered_component).to have_link "Sign Up"
      end
    end

    context "while visiting register page" do
      it "renders the sign in and sign up buttons" do
        allow_any_instance_of(ActionView::Helpers::UrlHelper).to receive(:current_page?).with(
          "/login"
        ) { false }

        allow_any_instance_of(ActionView::Helpers::UrlHelper).to receive(:current_page?).with(
          "/register"
        ) { true }
        render_inline(described_class.new)

        expect(rendered_component).not_to have_link "Sign In"
        expect(rendered_component).not_to have_link "Sign Up"
      end
    end

    context "while visiting login page" do
      it "renders the sign in and sign up buttons" do
        allow_any_instance_of(ActionView::Helpers::UrlHelper).to receive(:current_page?).with(
          "/register"
        ) { false }

        allow_any_instance_of(ActionView::Helpers::UrlHelper).to receive(:current_page?).with(
          "/login"
        ) { true }

        render_inline(described_class.new)

        expect(rendered_component).not_to have_link "Sign In"
        expect(rendered_component).not_to have_link "Sign Up"
      end
    end
  end

  context "user is authenticated" do
    let(:user) { build(:user) }

    context "while visiting non auth page" do
      it "does not render the sign in and sign up buttons" do
        allow_any_instance_of(SessionsHelper).to receive(:current_user) {
          user
        }

        allow_any_instance_of(CartHelper).to receive(:current_cart) {
          build_stubbed(:cart, user: user)
        }

        allow_any_instance_of(ActionView::Helpers::UrlHelper).to receive(:current_page?).with(
          "/register"
        ).and_return(false)

        allow_any_instance_of(ActionView::Helpers::UrlHelper).to receive(:current_page?).with(
          "/login"
        ).and_return(false)

        render_inline(described_class.new)

        expect(rendered_component).not_to have_link "Sign In"
        expect(rendered_component).not_to have_link "Sign Up"
      end

      it "renders with a cart button when cart exists" do
        allow_any_instance_of(SessionsHelper).to receive(:current_user) {
          user
        }

        allow_any_instance_of(CartHelper).to receive(:current_cart) {
          build_stubbed(:cart, user: user)
        }

        render_inline(described_class.new)

        expect(rendered_component).to have_selector("a[data-test-id=cart]", text: "0")
      end

      it "renders without a cart button when there is no cart" do
        allow_any_instance_of(SessionsHelper).to receive(:current_user) {
          user
        }

        allow_any_instance_of(CartHelper).to receive(:current_cart) { nil }

        render_inline(described_class.new)

        expect(rendered_component).not_to have_selector("a[data-test-id=cart]", text: "0")
      end
    end
  end
end
