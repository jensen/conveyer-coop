require 'rails_helper'

RSpec.describe "line_items/new", type: :view do
  let(:menu_item) { build_stubbed(:menu_item, name: "Menu Item", description: "Description.", price: 775) }
  let(:line_item) { build(:line_item, menu_item: menu_item) }

  context "user is authenticated" do
    it "renders an add to cart button" do
      allow_any_instance_of(SessionsHelper).to receive(:logged_in?) { true }

      assign(:line_item, line_item)

      render

      expect(rendered).to have_selector "input[type='number'][value='1']"
      expect(rendered).to match(/Add to cart - \$7.75/)
    end
  end

  context "user is not authenticated" do
    it "renders a login to order button" do
      allow_any_instance_of(SessionsHelper).to receive(:logged_in?) { false }

      assign(:line_item, line_item)

      render

      expect(rendered).to match(/Login to Order/)
    end
  end

  it "renders a menu item" do
    assign(:line_item, line_item)

    render

    expect(rendered).to match(/Menu Item/)
    expect(rendered).to match(/Description./)
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
