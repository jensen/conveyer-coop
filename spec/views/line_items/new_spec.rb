require 'rails_helper'

RSpec.describe "line_items/new", type: :view do
  let(:menu_item) { build_stubbed(:menu_item, name: "Menu Item", description: "Description.", price: 775) }
  let(:line_item) { build_stubbed(:line_item, menu_item: menu_item) }

  it "renders a menu item" do
    assign(:line_item, line_item)

    render

    expect(rendered).to match(/Menu Item/)
    expect(rendered).to match(/Description./)
  end

  it "renders an add to cart button" do
    assign(:line_item, line_item)

    render

    expect(rendered).to match(/Add to cart - \$7.75/)
  end

  context "with customizations" do
    let(:modification) { build(:modification,
                               name: "First Modification",
                               modification_options: [
                                 build(:modification_option, name: "First Modification Option")
                               ]) }
    let(:menu_item) { build_stubbed(:menu_item, name: "Menu Item",
                                    description: "Description.",
                                    modifications: [modification]) }
    it "renders a menu item" do
      assign(:line_item, line_item)

      render

      expect(rendered).to match(/First Modification/)
      expect(rendered).to match(/First Modification Option/)
    end
  end
end
