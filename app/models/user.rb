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

class User < ActiveRecord::Base

    has_secure_password

    before_save { self.email = email.downcase }
	validates :username, presence: true
	validates :zipcode, length: { is: 5 }, 
						numericality: { only_integer: true },
						allow_blank: true
	validates :password, length: { minimum: 6 }

end
