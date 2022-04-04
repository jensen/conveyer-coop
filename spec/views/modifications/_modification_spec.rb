require 'rails_helper'

RSpec.describe "modifications/_modification.html.erb", type: :view do
  let(:modification) { build(:modification,
                             name: "Modification",
                             required: false,
                             max_options: 2,
                             modification_options: [
                               build(:modification_option)
                             ]) }
  
  it "renders a menu item modification" do
    render partial: "modifications/modification", locals: { modification: modification }

    expect(rendered).to match(/Modification/)
    expect(rendered).to match(/Select up to 2/)
    expect(rendered).to match(/Optional/)

    expect(rendered).to have_rendered("modification_options/_modification_option")
  end
end
