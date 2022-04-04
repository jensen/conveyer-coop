require 'rails_helper'

RSpec.describe "modifications/_modification.html.erb", type: :view do
  let(:modification_option) { build(:modification_option, name: "Modification Option", price: 200, multiple: true) }

  it "renders a menu item modification" do
    render partial: "modification_options/modification_option", locals: { modification_option: modification_option }

    expect(rendered).to match(/Modification Option/)
  end
end
