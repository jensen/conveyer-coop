require 'rails_helper'

RSpec.describe CartHelper, type: :helper do
  let(:user) { create(:user) }
  let(:cart) { create(:cart, user: user) }

  context "current_cart" do
    it "should create a new cart for a new user" do
      session[:user_id] = user.id
      cart = helper.current_cart

      expect(cart).not_to be_nil
      expect(cart).to be_instance_of(Cart)
      expect(cart.user.id).to eq user.id
    end

    it "should return the existing cart for a returning user" do
      session[:cart_id] = cart.id

      cart = helper.current_cart

      expect(cart).not_to be_nil
      expect(cart).to be_instance_of(Cart)
      expect(cart.user.id).to eq user.id
    end
  end

  context "reset_cart" do
    it "should create a new cart and update the session" do
      session[:cart_id] = cart.id
      session[:user_id] = user.id

      helper.reset_cart

      # reset_cart
      expect(Cart.last.id).not_to eq cart.id
      expect(session[:cart_id]).not_to eq cart.id
      expect(session[:cart_id]).to eq Cart.last.id
    end
  end
end
