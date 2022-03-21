require 'rails_helper'

RSpec.describe "modifications/_modification.html.erb", type: :view do
  it "renders a menu item modification" do
    modification = build(:modification_with_options, name: "Modification", required: false, max_options: 2)

    render partial: "modifications/modification", locals: { modification: modification }

    expect(rendered).to match(/Modification/)
    expect(rendered).to match(/Select up to 2/)
    expect(rendered).to match(/Optional/)

    expect(rendered).to have_rendered("modification_options/_modification_option")
  end
end
