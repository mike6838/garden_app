# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  name_first      :string(255)
#  name_last       :string(255)
#  zipcode         :integer
#  created_at      :datetime
#  updated_at      :datetime
#  username        :string(255)
#  password_digest :string(255)
#

require 'spec_helper'

describe User do

  before { @user = User.new(username: "coolguy", name_first: "Example", name_last: "User", email: "user@example.com", zipcode: 12345, password: "koolie", password_confirmation: "koolie") }

  subject { @user }

  it { should respond_to(:name_first) }
  it { should respond_to(:name_last) }
  it { should respond_to(:email) }
  it { should respond_to(:zipcode) }
  it { should respond_to(:username) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when username is not present" do
  	before { @user.username = " " }
  	it { should_not be_valid }
  end

  describe "when zipcode is not five digits" do
    before { @user.zipcode = 1234 }
    it { should_not be_valid }
  end

  describe "when zipcode is not integers" do
    before { @user.zipcode = "dk$32" }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do 
       @user = User.new(username: "coolguy", name_first: "Example", name_last: "User", email: "user@example.com", 
         zipcode: 12345, password: " ", password_confirmation: " ") 
     end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }
  

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
end
