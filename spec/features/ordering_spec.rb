require 'rails_helper'

describe "the ordering process", type: :feature do
  context "user is logged in" do
    before :each do
      @cuisine = create(:cuisine, name: "Vegan")
      @restaurant = create(:restaurant,
                           name: "Chickpea",
                           images: [create(:image)],
                           cuisines: [@cuisine])
      @store = create(:store, address: "123 Store Address", restaurant: @restaurant)
      @menu_category = create(:menu_category, name: "Popular Items", restaurant: @restaurant)
      @menu_item = create(:menu_item, name: "Falafel Platter", menu_category: @menu_category)
      @user = create(:user, email: "test@user.com", password: "123", profile: create(:profile))
      @cart = create(:cart, user: @user)

      page.driver.browser.manage.window.resize_to(1280, 800)

      visit login_path

      fill_in "Email", with: "test@user.com"
      fill_in "Password", with: "123"

      click_button "Sign In"

      expect(page).to have_current_path(root_path)
    end

    it "allows the user to create a pickup order", js: true do
      visit root_path

      expect(page).to have_link 'Vegan', href: "/cuisines/vegan"
      expect(page).to have_link 'Chickpea', href: "/restaurants/chickpea"

      # this link has the display type "contents", selenium treats that as invisible
      # temporarily change the display type to "block" to click the link
      page.execute_script("document.querySelector('a.contents').style.display = 'block'")
      click_link 'Vegan', href: "/cuisines/vegan"
      page.execute_script("document.querySelector('a.contents').style.height = 'contents'")

      expect(page).to have_current_path(cuisine_path(slug: @cuisine.slug))

      expect(page).to have_link 'Vegan', href: "/cuisines/vegan"
      expect(page).to have_link 'Chickpea', href: "/restaurants/chickpea"

      click_link 'Chickpea', href: "/restaurants/chickpea"

      expect(page).to have_content "Chickpea"
      expect(page).to have_content "Popular Items"
      expect(page).to have_link "Falafel Platter"

      expect(page).not_to have_selector ".modal"

      click_link "Falafel Platter", href: "/menu_items/1/line_items/new"

      expect(page).to have_selector ".modal"
      expect(page).to have_button "Add to cart"

      expect(page).to have_selector "a[data-test-id='cart']", text: "0"

      within ".modal" do
        click_button "Add to cart"
      end

      expect(page).to have_selector "a[data-test-id='cart']", text: "1"

      within "turbo-frame#cart-preview>#cart-preview" do
        click_link "1"
      end

      expect(page).to have_button "Checkout"
      click_button "Checkout"

      expect(page).to have_selector "input[type='radio'][name='order[delivery]'][value='true'][checked='checked']"
      expect(page).not_to have_selector "input[type='radio'][name='order[delivery]'][value='false'][checked='checked']"

      expect(page).not_to have_content "Chickpea"

      find("input[type='radio'][name='order[delivery]'][value='false']").click

      expect(page).to have_content "Chickpea"
      expect(page).to have_content "123 Store Address"

      click_button "Checkout"

      expect(page).to have_content "Thank you for your order"
      expect(page).to have_content "The order will be ready for pickup soon at"
      expect(page).to have_content "Order ID: ##{Order.last.id}"
      expect(page).to have_current_path(order_path(Order.last))

      click_link "Order Again"

      expect(page).to have_current_path(root_path)
    end
  end
end
