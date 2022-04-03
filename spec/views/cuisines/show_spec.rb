require 'rails_helper'

RSpec.describe "cuisines/show", type: :view do
  it "renders a list of restaurants" do
    first_restaurant = build(:restaurant, name: "First Restaurant", slug: "first-restaurant", images: [
      build(:image, name: "first", extension: "jpg")
    ])
    second_restaurant = build(:restaurant, name: "Second Restaurant", slug: "second-restaurant", images: [
      build(:image, name: "second", extension: "jpg")
    ])

    cuisine = build(:cuisine, name: "Chicken", slug: "chicken", restaurants: [
      first_restaurant,
      second_restaurant
    ])

    assign(:cuisines, [cuisine])
    assign(:cuisine, cuisine)

    render

    expect(rendered).to have_link "First Restaurant", href: restaurant_path(slug: "first-restaurant")
    expect(rendered).to have_selector "img[src*='first.jpg']"

    expect(rendered).to have_link "Second Restaurant", href: restaurant_path(slug: "second-restaurant")
    expect(rendered).to have_selector "img[src*='second.jpg']"
  end
end
