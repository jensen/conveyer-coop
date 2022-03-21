require 'rails_helper'

RSpec.describe "modifications/_modification.html.erb", type: :view do
  it "renders a menu item modification" do
    option = build(:modification_option, name: "Modification Option", price: 200, multiple: true)

    render partial: "modification_options/modification_option", locals: { modification_option: option }

    expect(rendered).to match(/Modification Option/)
  end
end
