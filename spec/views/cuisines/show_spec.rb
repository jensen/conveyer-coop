require 'rails_helper'

RSpec.describe "cuisines/show", type: :view do
  it "renders a list of restaurants" do
    cuisine = create(:cuisine, :with_restaurants)

    assign(:cuisine, cuisine)

    render

    restaurant = cuisine.restaurants.first

    expect(rendered).to have_link "Restaurant 1", href: restaurant_path(slug: restaurant.slug)
    expect(rendered).to have_css "img[src*='#{restaurant.format_header_image}']"

    restaurant = cuisine.restaurants.second

    expect(rendered).to have_link "Restaurant 2", href: restaurant_path(slug: restaurant.slug)
    expect(rendered).to have_css "img[src*='#{restaurant.format_header_image}']"
  end
end
