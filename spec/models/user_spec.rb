require 'spec_helper'

describe User do
  
  before { @user = User.new(name: "Guest User", email: "guest@user.com") }
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @user.email = " " }
    
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @user.name = "a" * 32 }
    it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[guest@user,com user_at_my.org one.user@you. some@some_one.com me@you+i.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end
  
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[guest@user.COM MY_US-ER@my.own.org first.last@the.jp u+i@some.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end
  
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end
end
