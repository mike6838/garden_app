# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name_first :string(255)
#  name_last  :string(255)
#  zipcode    :integer
#  created_at :datetime
#  updated_at :datetime
#  username   :string(255)
#

require 'spec_helper'

describe User do

  before { @user = User.new(username: "coolguy", name_first: "Example", name_last: "User", email: "user@example.com", zipcode: 12345) }

  subject { @user }

  it { should respond_to(:name_first) }
  it { should respond_to(:name_last) }
  it { should respond_to(:email) }
  it { should respond_to(:zipcode) }
  it { should respond_to(:username) }

  it { should be_valid }

  describe "when username is not present" do
  	before { @user.username = " " }
  	it { should_not be_valid }
  end
end
