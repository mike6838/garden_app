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

class User < ActiveRecord::Base

	validates :username, presence: true
end
