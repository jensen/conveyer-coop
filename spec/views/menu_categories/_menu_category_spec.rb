require 'rails_helper'

RSpec.describe "menu_categories/_menu_category.html.erb", type: :view do
  let(:first_menu_item) { build_stubbed(:menu_item, name: "Item 1", description: "Item Description 1") }
  let(:second_menu_item) { build_stubbed(:menu_item, name: "Item 2", description: "Item Description 2") }
  let(:restaurant) { build(:restaurant, name: "Restaurant", slug: "restaurant") }
  let(:menu_category) { build(:menu_category,
                                      name: "Menu Category",
                                      menu_items: [
                                        first_menu_item,
                                        second_menu_item
                                      ],
                                      restaurant: restaurant) }
  it "renders a menu category" do
    render partial: "menu_categories/menu_category", locals: { menu_category: menu_category }

    expect(rendered).to match(/Menu Category/)

    expect(rendered).to match(/Item 1/)
    expect(rendered).to match(/Description 1/)
    expect(rendered).to match(/\$3.50/)

    expect(rendered).to match(/Item 2/)
    expect(rendered).to match(/Description 2/)

    expect(rendered).to have_selector "li", count: 2
    expect(rendered).to have_rendered("menu_items/_menu_item")
  end
end
