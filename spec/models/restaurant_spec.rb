require 'rails_helper'

describe Restaurant do
  it_behaves_like "sluggable"

  describe "#format_header_image" do
    let(:restaurant) { build(:restaurant, images: [
      build(:image, name: "test", extension: "jpg")
    ]) }

    it "combines the name and extension to get the header_image" do
      expect(restaurant.format_header_image).to eq "test.jpg"
    end
  end
end
