require "rails_helper"

describe ApplicationHelper do
  describe "#format_price", type: :helper do
    it "formats the price in cents to dollars" do
      expect(format_price 10099).to eq("$100.99")
      expect(format_price 350).to eq("$3.50")
    end
  end
end