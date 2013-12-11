require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "signup page" do
		before { visit signup_path }

		it { should have_content('Sign up') }
		it { should have_title(full_title('Sign up')) }
	end

	describe "signup" do
		before { visit signup_path }
		
		let(:submit) { "Create User" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end

			describe "unsuccessful signup" do
				before { click_button submit }

				it { should have_selector('div.alert.alert-error') }
			end
		end

		describe "with valid information" do
			before do
				fill_in "Username", 	with: "koolkid"
			end

			it "should create a user" do
        		expect { click_button submit }.to change(User, :count).by(1)
        	end	

 			describe "after saving the user" do
        		before { click_button submit }
        		let(:user) { User.find_by(username: 'koolkid') }

		        it { should have_title(user.username) }
		        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        	end
		end
	end

	describe "show page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.username) }
		it { should have_title(full_title(user.username)) }	
	end

	describe "edit page" do
	    let(:user) { FactoryGirl.create(:user) }
	    before { visit edit_user_path(user) }

	    it { should have_content("Update Profile") }
		it { should have_title(full_title(user.username)) }	
	end

end