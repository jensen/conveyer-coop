require 'rails_helper'

RSpec.describe "cuisines/index", type: :view do
  it "renders a list of cuisines" do
    chicken = build(:cuisine, name: "Chicken", slug: "chicken")
    burgers = build(:cuisine, name: "Burgers", slug: "chicken")

    cuisines = [
      chicken,
      burgers
    ]

    restaurants = [
      build(:restaurant, name: "Restaurant", images: [
        build(:image)
      ])
    ]

    assign(:cuisines, cuisines)
    assign(:restaurants, restaurants)

    render

    expect(rendered).to have_link 'Chicken', href: cuisine_path(slug: chicken.slug)
    expect(rendered).to have_link 'Burgers', href: cuisine_path(slug: burgers.slug)
  end
end
