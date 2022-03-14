require 'rails_helper'

RSpec.describe "cuisines/index", type: :view do
  it "renders a list of cuisines" do
    cuisines = build_list(:cuisine, 3) do |cuisine, i|
      cuisine.name = "Cuisine #{i}"
      cuisine.slug = "cuisine-#{i}"
    end

    assign(:cuisines, cuisines)

    render

    expect(rendered).to have_link 'Cuisine 0', href: cuisine_path(slug: cuisines.first.slug)
    expect(rendered).to have_link 'Cuisine 1', href: cuisine_path(slug: cuisines.second.slug)
    expect(rendered).to have_link 'Cuisine 2', href: cuisine_path(slug: cuisines.third.slug)
  end
end
