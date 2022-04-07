# frozen_string_literal: true

class PriceButtonComponent < ApplicationComponent
  def initialize(total:)
    @total = total
  end
end
