require 'rails_helper'

RSpec.describe "cuisines/show", type: :view do
  fixtures :cuisines, :restaurants, :culinary_styles, :images

  it "renders a list of restaurants" do
    assign(:cuisine, cuisines(:chicken))

    render

    juke = restaurants(:juke)
    expect(rendered).to have_link "Juke Fried Chicken", href: restaurant_path(slug: juke.slug)
    expect(rendered).to have_css "img[src*='#{juke.format_header_image}']"

    kfc = restaurants(:kfc)
    expect(rendered).to have_link "KFC", href: restaurant_path(slug: kfc.slug)
    expect(rendered).to have_link "Chicken, Fast Food", href: restaurant_path(slug: kfc.slug)
    expect(rendered).to have_css "img[src*='#{kfc.format_header_image}']"

    wendys = restaurants(:wendys)
    expect(rendered).to have_link "Wendy's", href: restaurant_path(slug: wendys.slug)
    expect(rendered).to have_link "Chicken, Burgers, Fast Food", href: restaurant_path(slug: wendys.slug)
    expect(rendered).to have_css "img[src*='#{wendys.format_header_image}']"

  end
end
