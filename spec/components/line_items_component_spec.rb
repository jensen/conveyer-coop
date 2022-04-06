# frozen_string_literal: true

require "rails_helper"

RSpec.describe LineItemsComponent, type: :component do
  let(:line_items) { [
    build_stubbed(:line_item, menu_item: build(:menu_item, name: "Menu Item 1")),
    build_stubbed(:line_item, menu_item: build(:menu_item, name: "Menu Item 2"))
  ] }

  it "renders a list of line items" do
    render_inline(described_class.new(line_items: line_items))

    expect(rendered_component).to have_selector "li", text: "Menu Item 1"
    expect(rendered_component).to have_selector "li", text: "Menu Item 2"
  end

  it "doesn't render a destroy button when the items are readonly " do
    render_inline(described_class.new(line_items: line_items, readonly: true))

    expect(rendered_component).not_to have_selector "a[data-turbo-method='delete'][href='#{line_item_path(line_items.first)}']"
  end

  it "renders a destroy button when the items are not readonly" do
    render_inline(described_class.new(line_items: line_items, readonly: false))

    expect(rendered_component).to have_selector "a[data-turbo-method='delete'][href='#{line_item_path(line_items.first)}']"
  end
end
