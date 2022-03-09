require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  before :each do
    @user = User.create(email: "test@user.com", password: "abc", password_confirmation: "abc")
  end

  it "creates a session on login" do
    expect(helper.logged_in?).to be(false)

    helper.log_in(@user)

    expect(helper.logged_in?).to be(true)
  end

  it "destroys a session on logout" do
    helper.log_in(@user)

    expect(helper.logged_in?).to be(true)

    helper.log_out

    expect(helper.logged_in?).to be(false)
  end

  context "#current_user" do
    it "should provide nil as current user before login" do
      expect(helper.current_user).to be_nil
    end

    it "should provide the current user after login" do
      helper.log_in(@user)
      expect(helper.current_user).to eq(@user)
    end
  end

  context "#current_user?" do
    it "is the current user" do
      helper.log_in(@user)


      expect(helper.current_user?(@user)).to eq(true)
    end
  end
end
