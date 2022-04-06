# frozen_string_literal: true

class CartComponent < ApplicationComponent
  include Turbo::FramesHelper

  def initialize(line_items:)
    @line_items = line_items
  end

  private

    def render_empty?
      @line_items.empty?
    end
end
