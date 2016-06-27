class GroupsController < ApplicationController
	def index
		@user = current_user
		@group = Group.all
	end

	def create
		@groups = Group.new group_params

		if @groups.save
			redirect_to :back
		else
			flash[:errors] = ["Invalid"]
			redirect_to :back
		end
	end

	def show
		@current_user = current_user
		@groups = Group.find(params[:id])
		
		@user = @groups.user
		@users = @groups.user_attendings.all
		@users_uniq = @users.uniq 

	end


	private
	def group_params
		params.require(:group).permit(:name, :description).merge(user: current_user)
	end
end
