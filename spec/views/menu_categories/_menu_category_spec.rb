require 'rails_helper'

RSpec.describe "menu_categories/_menu_category.html.erb", type: :view do
  it "renders a menu category" do
    menu_category = build_stubbed(:menu_category_with_items)

    render partial: "menu_categories/menu_category", locals: { menu_category: menu_category }

    expect(rendered).to match(/Category/)

    expect(rendered).to match(/Item 1/)
    expect(rendered).to match(/Description 1/)
    expect(rendered).to match(/\$3.50/)

    expect(rendered).to match(/Item 2/)
    expect(rendered).to match(/Description 2/)

    expect(rendered).to have_css "li", count: 3
    expect(rendered).to have_rendered("menu_items/_menu_item")
  end
end
