require 'rails_helper'

describe Restaurant do
  it_behaves_like "sluggable"

  describe "#format_header_image" do
    it "combines the name and extension to get the header_image" do
      restaurant = build(:restaurant_with_images)

      expect(restaurant.format_header_image).to eq "#{restaurant.images.first.name}.#{restaurant.images.first.extension}"
    end
  end
end