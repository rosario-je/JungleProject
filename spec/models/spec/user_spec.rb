require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(
      email: "test@test.com",
      first_name: "Test",
      last_name: "User",
      password: "password",
      password_confirmation: "password"
    )
  end

  describe 'Validations' do
    it "must be created with a password and password confirmation that match" do
      @user.password_confirmation = "password"
      expect(@user).to be_valid
    end

    it "is invalid if password and password_confirmation do not match" do
      @user.password_confirmation = "differentpassword"
      expect(@user).to_not be_valid
    end

    it "is invalid without a password" do
      @user.password = nil
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "is invalid without a unique email (not case sensitive)" do
      User.create(
        email: "test@test.com",
        first_name: "Test",
        last_name: "User",
        password: "password",
        password_confirmation: "password"
      )
      duplicate_user = User.new(
        email: "TEST@TEST.com",
        first_name: "Test",
        last_name: "User",
        password: "password",
        password_confirmation: "password"
      )
      expect(duplicate_user).to_not be_valid
    end

    it "is invalid without an email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "is invalid without a first name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "is invalid without a last name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "is invalid if password is less than 6 characters" do
      @user.password = @user.password_confirmation = "short"
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user.save!
    end

    it "returns the user if credentials are correct" do
      authenticated_user = User.authenticate_with_credentials("test@test.com", "password")
      expect(authenticated_user).to eq(@user)
    end

    it "returns nil if credentials are incorrect" do
      authenticated_user = User.authenticate_with_credentials("test@test.com", "wrongpassword")
      expect(authenticated_user).to be_nil
    end

    it "authenticates with email having leading/trailing spaces" do
      authenticated_user = User.authenticate_with_credentials("  test@test.com  ", "password")
      expect(authenticated_user).to eq(@user)
    end

    it "authenticates with email in different case" do
      authenticated_user = User.authenticate_with_credentials("TeSt@TeSt.CoM", "password")
      expect(authenticated_user).to eq(@user)
    end
  end
end
