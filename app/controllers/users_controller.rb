class UsersController < ApplicationController
	def create
		@users = User.new user_params

		if @users.save
			flash[:errors] = ["Success"] 
			redirect_to "/sessions/new"
		else
			flash[:errors] = [@users.errors.full_messages]
			redirect_to :back
		end 
	end

	

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
