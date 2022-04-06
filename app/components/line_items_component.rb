# frozen_string_literal: true

class LineItemsComponent < ApplicationComponent
  include Turbo::FramesHelper

  def initialize(line_items:, readonly: false)
    @line_items = line_items
    @readonly = readonly
  end

  private

    def render_remove?
      @readonly == false
    end
end
