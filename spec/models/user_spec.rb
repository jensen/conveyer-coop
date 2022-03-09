require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid without an email" do
    user = User.new()

    expect(user).not_to be_valid
    expect(user.errors.messages[:email]).to include("can't be blank")
  end

  it "is invalid if the password is blank" do
    user = User.new(email: "test@user.com", password: "", password_confirmation: "")

    expect(user).not_to be_valid
    expect(user.errors.messages[:password]).to include("can't be blank")
  end

  it "is invalid with a duplicate email" do
    user = User.create(email: "test@user.com", password: "abc", password_confirmation: "abc")
    second = User.new(email: "test@user.com", password: "abc", password_confirmation: "abc")

    expect(user).to be_valid

    expect(second).not_to be_valid
    expect(second.errors.messages[:email]).to include("has already been taken")
  end

  it "is invalid if passwords do not match" do
    user = User.new(email: "test@user.com", password: "abc", password_confirmation: "123")

    expect(user).not_to be_valid
    expect(user.errors.messages[:password_confirmation]).to include("doesn't match Password")
  end
end
