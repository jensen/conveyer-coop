require 'rails_helper'

RSpec.describe "cuisines/index", type: :view do
  it "renders a list of cuisines" do
    cuisines = [
      build(:cuisine, name: "Chicken", slug: "chicken"),
      build(:cuisine, name: "Burgers", slug: "burgers")
    ]

    restaurants = [
      build(:restaurant, name: "Restaurant", images: [
        build(:image)
      ])
    ]

    assign(:cuisines, cuisines)
    assign(:restaurants, restaurants)

    render

    expect(rendered).to have_link 'Chicken', href: cuisine_path(slug: "chicken")
    expect(rendered).to have_link 'Burgers', href: cuisine_path(slug: "burgers")
  end
end
