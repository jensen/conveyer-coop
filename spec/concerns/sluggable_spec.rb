require 'rails_helper'

shared_examples "sluggable" do
  let(:sluggable) { described_class.create(name: "String and Space's") }

  it "replaces uppercase with lowercase" do
    sluggable = described_class.create(name: "Fancy")
    expect(sluggable.slug).to eq("fancy")
  end

  it "replaces spaces with hyphens" do
    sluggable = described_class.create(name: "String with spaces")
    expect(sluggable.slug).to eq("string-with-spaces")
  end

  it "removes single quotes" do
    sluggable = described_class.create(name: "Quote's")
    expect(sluggable.slug).to eq("quotes")
  end
end