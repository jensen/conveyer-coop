RSpec.describe "orders/show", type: :view do
  it "renders a thank you message" do
    assign(:order, build(:order))

    render

    expect(rendered).to match(/Thank you for your order/)
  end

  it "renders the order identifier" do
    order = build_stubbed(:order)

    assign(:order, order)

    render

    expect(rendered).to match("Order ID: ##{order.id}")
  end

  it "renders a message for delivery" do
    assign(:order, build(:order, delivery: true))

    render

    expect(rendered).to match(/The order will be delivered to your address/)
  end

  it "renders a message for pickup" do
    assign(:order, build(:order, delivery: false))

    render

    expect(rendered).to match(/The order will be ready for pickup soon at/)
  end

  it "renders a call to action for ordering again" do
    assign(:order, build(:order))

    render

    expect(rendered).to match(/Still Hungry?/)
    expect(rendered).to have_selector "a[href='#{root_path}']", text: "Order Again"
  end
end
