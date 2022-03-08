require "rails_helper"

describe ImageHelper do
  describe "#resizable_image_tag", type: :helper do
    it "returns the doordash cdn image tag" do
      expect(helper.resizeable_image_tag("abc.jpg", 100, 100)).to eq("<img src=\"https://img.cdn4dd.com/cdn-cgi/image/fit=cover,width=100,height=100,format=auto,quality=50/https://doordash-static.s3.amazonaws.com/media/store/header/abc.jpg\" />")
    end
  end
end