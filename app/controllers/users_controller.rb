class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to Garden_App @_@"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
	end

		  private

		    def user_params
		      params.require(:user).permit(:username, :email, :name_last,
		      								:name_first, :zipcode)
		    end

end
