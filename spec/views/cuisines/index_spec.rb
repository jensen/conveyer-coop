require 'rails_helper'

RSpec.describe "cuisines/index", type: :view do
  fixtures :cuisines

  it "renders a list of cuisines" do
    assign(:cuisines, cuisines)

    render

    expect(rendered).to have_link 'Chicken', href: cuisine_path(slug: cuisines.first.slug)
    expect(rendered).to have_link 'Burgers', href: cuisine_path(slug: cuisines.second.slug)
    expect(rendered).to have_link 'Fast Food', href: cuisine_path(slug: cuisines.third.slug)
  end
end
