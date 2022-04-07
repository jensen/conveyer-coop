# frozen_string_literal: true

class CartPreviewComponent < ApplicationComponent
  include Turbo::FramesHelper

  def initialize(cart:)
    @cart = cart
  end
end
